module gollom.command.impl.not_implemented

import gollom.command.reply

function executeNotImplemented = |command| {
  return ErrorReply("command not implemented: " + command)
}
