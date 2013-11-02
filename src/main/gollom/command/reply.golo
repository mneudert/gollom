module gollom.command.reply

struct CommandReply = { reply }

augment gollom.command.reply.types.CommandReply {
  function send = |this, writer| {
    writer: writeBytes(this: reply() + "\r\n")
  }
}
