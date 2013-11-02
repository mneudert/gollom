module gollom.command.handler

import gollom.command
import gollom.command.decoder

struct CommandHandler = { reader, writer }

augment gollom.command.handler.types.CommandHandler {
  function handle = |this| {
    let command = CommandDecoder(this: reader()): decode()

    command: execute(this: writer())
  }
}
