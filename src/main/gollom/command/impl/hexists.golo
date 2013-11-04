module gollom.command.impl.hexists

import gollom.command.reply

function executeHexists = |key, field, datastore| {
  if not datastore: containsKey(key) {
    return IntegerReply(0)
  }

  if datastore: get(key): containsKey(field) {
    return IntegerReply(1)
  } else {
    return IntegerReply(0)
  }
}
