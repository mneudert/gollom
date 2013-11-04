module gollom.command.impl.hset

import gollom.command.reply

function executeHset = |key, field, value, datastore| {
  if not datastore: containsKey(key) {
    datastore: put(key, map[[field, value]])
  } else {
    datastore: get(key): put(field, value)
  }

  println(datastore: get(key))
  return CommandReply("+OK")
}
