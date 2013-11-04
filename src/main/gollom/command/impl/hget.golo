module gollom.command.impl.hget

import gollom.command.reply

function executeHget = |key, field, datastore| {
  let hash = datastore: get(key)

  if hash is null {
    return MultiBulkReply(null)
  }

  let value = hash: get(field)

  if value is null {
    return MultiBulkReply(null)
  } else {
    return BulkReply(value)
  }
}
