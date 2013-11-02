module gollom.command.impl.not_implemented

import gollom.command.reply

function executeNotImplemented = |command| {
  println("Command not implemented: " + command)
  return CommandReply("*-1")
}
