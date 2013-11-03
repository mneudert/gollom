module gollom.command.reply

struct CommandReply = { reply }
struct ErrorReply   = { message }

augment gollom.command.reply.types.CommandReply {
  function send = |this, writer| {
    writer: writeBytes(this: reply() + "\r\n")
  }
}

augment gollom.command.reply.types.ErrorReply {
  function send = |this, writer| {
    writer: writeBytes("-ERR " + this: message() + "\r\n")
  }
}
