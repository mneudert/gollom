module gollom.command.decoder

import java.lang.Character
import java.lang.StringBuilder

import gollom.command

struct CommandDecoder = { reader }

local function cr = { return Character.toChars(13): get(0) }
local function nl = { return Character.toChars(10): get(0) }

augment gollom.command.decoder.types.CommandDecoder {
  function decode = |this| {
    let argCount = this: decodeArgCount(this: reader())

    if argCount is 0 {
      return null
    }

    let command = this: readString(this: reader())
    var args    = list[]

    for (var i = 1, i < argCount, i = i + 1) {
      args: append(this: readString(this: reader()))
    }

    return Command(command, args)
  }

  function decodeArgCount = |this, reader| {
    let char = this: readChar(reader)

    if char isnt '*' {
      return 0
    }

    return this: readNumber(reader)
  }

  function readChar = |this, reader| {
    return Character.toChars(reader: read()): get(0)
  }

  function readNumber = |this, reader| {
    var value = StringBuilder()
    var sign  = 1

    var char = this: readChar(reader)

    if char is '-' {
      sign = -1
      char = this: readChar(reader)
    }

    while(true) {
      if char is cr() {
        char = this: readChar(reader)

        if char is nl() {
          break
        }
      }

      value = value: append(char)
      char  = this: readChar(reader)
    }

    return value: toString(): toInt() * sign
  }

  function readString = |this, reader| {
    let char = this: readChar(reader)

    if char isnt '$' {
      return ""
    }

    let strlen = this: readNumber(reader)
    var value  = StringBuilder()

    for (var i = 0, i < strlen, i = i + 1) {
      value = value: append(this: readChar(reader))
    }

    if this: readChar(reader) is cr() {
      if this: readChar(reader) is nl() {
        return value: toString()
      }
    }

    println("Failed to read string with length " + strlen)
    return ""
  }
}
