module gollom.command

import gollom.command.impl.get
import gollom.command.impl.not_implemented
import gollom.command.impl.ping
import gollom.command.impl.set
import gollom.command.reply

struct Command = { command, args }

function executeCommand = |command, datastore| {
  return match {
    when command: command(): equals("GET") then executeGet(command: args(): get(0), datastore)
    when command: command(): equals("PING") then executePing()
    when command: command(): equals("SET") then executeSet(command: args(): get(0), command: args(): get(1), datastore)

    otherwise executeNotImplemented(command)
  }
}
