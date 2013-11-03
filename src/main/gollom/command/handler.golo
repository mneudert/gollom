module gollom.command.handler

import gollom.command
import gollom.command.decoder
import gollom.command.reply

struct CommandHandler = { reader, writer }

augment gollom.command.handler.types.CommandHandler {
  function handle = |this, datastore| {
    let command = CommandDecoder(this: reader()): decode()

    executeCommand(command, datastore): send(this: writer())
  }
}
