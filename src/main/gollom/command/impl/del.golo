module gollom.command.impl.del

import gollom.command.reply

function executeDel = |keys, datastore| {
  var deleted = 0

  foreach key in keys {
    if datastore:remove(key) isnt null {
      deleted = deleted + 1
    }
  }

  return IntegerReply(deleted)
}
