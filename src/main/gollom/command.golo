module gollom.command

import java.lang.IndexOutOfBoundsException

import gollom.command.impl.del
import gollom.command.impl.exists
import gollom.command.impl.hexists
import gollom.command.impl.hget
import gollom.command.impl.hset
import gollom.command.impl.get
import gollom.command.impl.not_implemented
import gollom.command.impl.ping
import gollom.command.impl.set
import gollom.command.reply

struct Command = { command, args }

function executeCommand = |command, datastore| {
  try {
    let args = command: args()

    return match {
      when command: command(): equals("DEL") then executeDel(args, datastore)
      when command: command(): equals("EXISTS") then executeExists(args: get(0), datastore)
      when command: command(): equals("HEXISTS") then executeHexists(args: get(0), args: get(1), datastore)
      when command: command(): equals("HGET") then executeHget(args: get(0), args: get(1), datastore)
      when command: command(): equals("HSET") then executeHset(args: get(0), args: get(1), args: get(2), datastore)
      when command: command(): equals("GET") then executeGet(args: get(0), datastore)
      when command: command(): equals("PING") then executePing()
      when command: command(): equals("SET") then executeSet(args: get(0), args: get(1), datastore)

      otherwise executeNotImplemented(command)
    }
  } catch (e) {
    case {
      when e oftype IndexOutOfBoundsException.class {
        return ErrorReply("invalid number of arguments")
      }

      otherwise {
        throw e
      }
    }
  }
}
