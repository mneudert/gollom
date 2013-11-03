module gollom.command.impl.exists

import gollom.command.reply

function executeExists = |key, datastore| {
  if datastore: containsKey(key) {
    return CommandReply(":1")
  } else {
    return CommandReply(":0")
  }
}
