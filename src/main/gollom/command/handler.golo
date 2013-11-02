module gollom.command.handler

import gollom.command
import gollom.command.decoder
import gollom.command.reply

struct CommandHandler = { reader, writer }

augment gollom.command.handler.types.CommandHandler {
  function handle = |this| {
    let command = CommandDecoder(this: reader()): decode()
    let reply   = command: execute()

    reply: send(this: writer())
  }
}
