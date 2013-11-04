module gollom.command.reply

struct BulkReply      = { data }
struct ErrorReply     = { message }
struct IntegerReply   = { value }
struct MultiBulkReply = { data }
struct StatusReply    = { status }

augment gollom.command.reply.types.BulkReply {
  function send = |this, writer| {
    writer: writeBytes("$" + this: data(): length() + "\r\n" + this: data() + "\r\n")
  }
}

augment gollom.command.reply.types.ErrorReply {
  function send = |this, writer| {
    writer: writeBytes("-ERR " + this: message() + "\r\n")
  }
}

augment gollom.command.reply.types.IntegerReply {
  function send = |this, writer| {
    writer: writeBytes(":" + this: value() + "\r\n")
  }
}

augment gollom.command.reply.types.MultiBulkReply {
  function send = |this, writer| {
    if this: data() is null {
      writer: writeBytes("*-1\r\n")
    }
  }
}

augment gollom.command.reply.types.StatusReply {
  function send = |this, writer| {
    writer: writeBytes("+" + this: status() + "\r\n")
  }
}
