module gollom.command.impl.ping

import gollom.command.reply

function executePing = {
  return CommandReply("+PONG")
}
