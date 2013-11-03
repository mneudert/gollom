module gollom.command.impl.get

import gollom.command.reply

function executeGet = |key, datastore| {
  let value = datastore: get(key)

  return CommandReply("$" + value: length() + "\r\n" + value)
}
