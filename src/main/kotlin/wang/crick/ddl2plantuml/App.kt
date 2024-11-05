package wang.crick.ddl2plantuml

import picocli.CommandLine
import java.nio.file.Path
import java.util.concurrent.Callable
import kotlin.system.exitProcess

/**
 * DDL 转换为 PlantUML 的主入口函数。
 * 解析命令行参数并处理 SQL DDL 文件生成 PlantUML ER 图。
 *
 * @param args 命令行参数
 */
fun main(args: Array<String>) {
    // 创建一个 CommandLine 对象用于 Convert 类
    val cmd = CommandLine(Convert())
    when {
        // 如果没有提供命令行参数，显示使用帮助信息
        args.isEmpty() -> {
            cmd.usage(System.out)
        }
        // 否则，执行命令并以相应的退出代码退出
        else -> {
            val exitCode = cmd.execute(*args)
            exitProcess(exitCode)
        }
    }
}

/**
 * Convert 类，用于将 SQL DDL 文件转换为 PlantUML ER 图。
 * 提供命令行选项和参数解析。
 */
@CommandLine.Command(
    name = "ddl2plantuml",
    version = ["软件名称：Ddl2plantuml", "版本：V1.1.0"],
    description = ["将 SQL @|bold,fg(red) DDL|@ 转换为 @|bold,fg(red) PlantUML|@ ER 图"],
    mixinStandardHelpOptions = true
)
class Convert : Callable<Int> {

    /**
     * 源 SQL DDL 文件路径。
     */
    @CommandLine.Parameters(index = "0", paramLabel = "FILE", description = ["要转换为 PlantUML ER 的 SQL DDL 文件"])
    lateinit var src: Path

    /**
     * 输出 PlantUML 文件路径。如果不指定，默认输出到控制台。
     */
    @CommandLine.Option(names = ["-o", "--output"], description = ["PlantUML 文件保存的位置，默认为控制台"])
    private var target: Path? = null

    /**
     * 执行转换操作。
     * 读取源文件内容并根据目标路径输出到控制台或文件。
     *
     * @return 退出代码
     */
    override fun call(): Int {
        require(src.toFile().exists()) { "DDL 文件必须存在！" }
        when (target) {
            null -> {
                // 读取源文件内容并输出到控制台
                FileReader(src).read()
                    .apply { ConsoleWriter(this).write() }
            }

            else -> {
                // 读取源文件内容并输出到指定文件
                FileReader(src).read()
                    .apply { FileWriter(target!!, this).write() }
            }
        }
        return 0
    }

}
