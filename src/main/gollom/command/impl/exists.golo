module gollom.command.impl.exists

import gollom.command.reply

function executeExists = |key, datastore| {
  if datastore: containsKey(key) {
    return IntegerReply(1)
  } else {
    return IntegerReply(0)
  }
}
