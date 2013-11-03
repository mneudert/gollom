module gollom.command.impl.get

import gollom.command.reply

function executeGet = |key, datastore| {
  let value = datastore: get(key)

  if value is null {
    return CommandReply("*-1")
  } else {
    return CommandReply("$" + value: length() + "\r\n" + value)
  }
}
