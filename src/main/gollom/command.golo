module gollom.command

import gollom.command.impl.not_implemented
import gollom.command.impl.ping
import gollom.command.reply

struct Command = { command, args }

augment gollom.command.types.Command {
  function execute = |this| {
    return match {
      when this: command(): equals("PING") then executePing()

      otherwise executeNotImplemented(this: command())
    }
  }
}
