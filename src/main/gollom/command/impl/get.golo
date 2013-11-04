module gollom.command.impl.get

import gollom.command.reply

function executeGet = |key, datastore| {
  let value = datastore: get(key)

  if value is null {
    return MultiBulkReply(null)
  } else {
    return BulkReply(value)
  }
}
