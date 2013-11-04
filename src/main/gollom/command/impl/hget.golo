module gollom.command.impl.hget

import gollom.command.reply

function executeHget = |key, field, datastore| {
  let hash = datastore: get(key)

  if hash is null {
    return CommandReply("*-1")
  }

  let value = hash: get(field)

  if value is null {
    return CommandReply("*-1")
  } else {
    return CommandReply("$" + value: length() + "\r\n" + value)
  }
}
