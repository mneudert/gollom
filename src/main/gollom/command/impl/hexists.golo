module gollom.command.impl.hexists

import gollom.command.reply

function executeHexists = |key, field, datastore| {
  if datastore: get(key): containsKey(field) {
    return CommandReply(":1")
  } else {
    return CommandReply(":0")
  }
}
