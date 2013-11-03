module gollom.command.impl.del

import gollom.command.reply

function executeDel = |key, datastore| {
  if datastore: remove(key) is null {
    return CommandReply(":0")
  } else {
    return CommandReply(":1")
  }
}
