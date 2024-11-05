package wang.crick.ddl2plantuml

import net.sf.jsqlparser.parser.CCJSqlParserUtil
import net.sf.jsqlparser.statement.create.table.ColumnDefinition
import net.sf.jsqlparser.statement.create.table.CreateTable
import java.nio.file.Files
import java.nio.file.Path
import java.util.*
import java.util.stream.Collectors

/**
 * 默认数据库类型常量
 */
const val DEFAULT_DB_TYPE = "mysql"

/**
 * 读取和解析DDL以生成表信息的接口
 */
interface Reader {

    /**
     * 读取并解析DDL文件以生成表信息
     *
     * @param dbType 数据库类型，默认为 [DEFAULT_DB_TYPE]
     * @return 返回一个包含表信息的可迭代列表
     */
    fun read(dbType: String? = DEFAULT_DB_TYPE): Iterable<Table>

    /**
     * 从给定的SQL语句中提取表信息
     *
     * @param dbType 数据库类型
     * @param sql SQL语句
     * @return 返回表信息
     */
    fun extract(dbType: String, sql: String): Table {
        // 解析SQL语句
        val statement: CreateTable = CCJSqlParserUtil.parse(sql) as CreateTable
        // 提取并处理表名
        val name = shaveName(statement.table.name)
        // 提取并处理列信息
        val columnList = extractColumn(statement.columnDefinitions)

        // 返回表信息
        return Table(
            name,
            statement.tableOptionsStrings.last().toString().shaveComment(),
            columnList
        )
    }

    /**
     * 从列定义中提取列信息
     *
     * @param columnDefinitions 列定义
     * @return 返回一个包含列信息的列表
     */
    private fun extractColumn(columnDefinitions: List<ColumnDefinition>): List<Column> {
        return columnDefinitions.stream()
            .map { col ->
                // 提取并处理列名
                val name = col.columnName.shaveComment()
                var comment = ""
                var defaultValue = ""

                // 提取并处理列注释
                val commentIndex = col.columnSpecs.map { it.toUpperCase() }.indexOf("COMMENT")
                if (commentIndex > -1) {
                    comment = col.columnSpecs[commentIndex + 1]
                }

                // 提取并处理列默认值
                val defaultValueIndex = col.columnSpecs.map { it.toUpperCase() }.indexOf("DEFAULT")
                if (defaultValueIndex > -1) {
                    defaultValue = col.columnSpecs[defaultValueIndex + 1]
                }

                // 提取数据类型和大小信息
                val dataType = col.colDataType
                val dataTypeArguments = dataType.argumentsStringList
                var size = 0
                if (null != dataTypeArguments && dataTypeArguments.size > 0) {
                    size = Integer.parseInt(dataTypeArguments[0].toString())
                }

                // 判断列是否为非空
                val notNull = col.columnSpecs.joinToString(",").toUpperCase().contains("NOT,NULL")
                // 返回列信息
                Column(name, comment, dataType.dataType, size, defaultValue, notNull)
            }.collect(Collectors.toList())
    }

    /**
     * 处理表和列名，去除特殊字符并修剪空白
     *
     * @param name 要处理的名称字符串
     * @return 返回处理后的名称字符串
     */
    private fun shaveName(name: String): String {
        return name.replace("`", "").trim()
    }

    /**
     * 处理注释和默认值，转换为字符串并修剪空白
     *
     * @return 返回处理后的字符串
     */
    private fun Any.shaveComment(): String {
        return Objects.toString(this, "").replace("'", "").trim()
    }

    /**
     * 解析DDL语句列表以生成表信息
     *
     * @param list DDL语句列表
     * @param dbType 数据库类型
     * @return 返回一个包含表信息的可迭代列表
     */
    fun parse(list: List<String>, dbType: String?): Iterable<Table> {
        return list
            .filter { !it.startsWith("#") }
            .joinToString("")
            .split(";")
            .filter { it.isNotBlank() }
            .map { extract(dbType ?: DEFAULT_DB_TYPE, it) }
            .toList()
    }
}

/**
 * 从文件系统路径读取DDL文件的类
 */
class FileReader(private val path: Path) : Reader {

    /**
     * 从文件系统路径读取并解析DDL文件以生成表信息
     *
     * @param dbType 数据库类型，默认为 [DEFAULT_DB_TYPE]
     * @return 返回一个包含表信息的可迭代列表
     */
    override fun read(dbType: String?): Iterable<Table> {
        // 读取并解析DDL文件内容
        return parse(Files.readAllLines(path), dbType)
    }

}

/**
 * 从字符串读取DDL文件的类
 */
class StringReader(private val ddl: String) : Reader {

    /**
     * 从字符串读取并解析DDL文件以生成表信息
     *
     * @param dbType 数据库类型，默认为 [DEFAULT_DB_TYPE]
     * @return 返回一个包含表信息的可迭代列表
     */
    override fun read(dbType: String?): Iterable<Table> {
        // 解析DDL内容
        return parse(ddl.lines(), dbType)
    }

}