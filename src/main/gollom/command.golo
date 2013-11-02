module gollom.command

struct Command = { command, args }

augment gollom.command.types.Command {
  function execute = |this, writer| {
    println("Command<" + this: command() + ">" + this: args())

    writer: writeBytes("*-1\r\n")
  }
}
