package wang.crick.ddl2plantuml

import java.nio.file.Files
import java.nio.file.Path

/**
 * Writer接口定义了将解析后的数据写入指定目标的功能
 */
interface Writer {

    /**
     * 写入解析后的数据到指定的目标，具体目标由实现类决定
     */
    fun write()

    /**
     * 解析表格信息并生成字符串格式的PlantUML代码
     *
     * @param tables 一个包含多个Table对象的集合，代表待解析的表格信息
     * @return 返回格式化后的PlantUML代码字符串
     */
    fun parse(tables: Iterable<Table>): String {
        // 读取模板文件
        val template = Thread.currentThread().contextClassLoader.getResource("dot.template")!!.readText()

        // 遍历每个表格，生成PlantUML代码
        val content = tables.joinToString("") { table ->
            // 遍历表格中的每一列，生成列的PlantUML代码
            val columns = table.columnList.joinToString("\n") { "    ${it.name.notNull()} : ${it.type.notNull()} ${it.comment.notNull()}" }
            // 生成单个表格的PlantUML代码
            "Table(${table.name}, \"${table.name}\\n(${table.comment})\"){ \n$columns \n } \n \n"
        }

        // 使用生成的内容替换模板中的占位符
        return template.replace("__content__", content)
    }


    fun String.notNull(): String {
        // 如果字符串为空或者为null，则返回空字符串
        var result = this?.replace("`", "") ?: ""
        result = result.replace("'", "")

        // 去除圆括号及其内的内容
        val pattern = Regex("\\(.*?\\)")
        result = pattern.replace(result, "")

        return result
    }
}

/**
 * FileWriter类实现了Writer接口，将解析后的数据写入到文件中
 *
 * @param path 指定文件路径，用于写入解析后的数据
 * @param tables 一个包含多个Table对象的集合，代表待解析的表格信息
 */
class FileWriter(private val path: Path, private val tables: Iterable<Table>) : Writer {

    /**
     * 写入解析后的数据到指定的文件路径
     */
    override fun write() {
        // 将解析后的数据以字节流的形式写入文件
        Files.write(path, parse(tables).toByteArray())
    }
}

/**
 * ConsoleWriter类实现了Writer接口，将解析后的数据输出到控制台
 *
 * @param tables 一个包含多个Table对象的集合，代表待解析的表格信息
 */
class ConsoleWriter(private val tables: Iterable<Table>) : Writer {

    /**
     * 将解析后的数据输出到控制台
     */
    override fun write() {
        // 在控制台打印解析后的数据
        println(parse(tables))
    }
}
