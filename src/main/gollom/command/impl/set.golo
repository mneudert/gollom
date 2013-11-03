module gollom.command.impl.set

import gollom.command.reply

function executeSet = |key, value, datastore| {
  datastore: put(key, value)

  return CommandReply("+OK")
}
