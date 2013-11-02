module gollom.server

import java.io.BufferedReader
import java.io.DataOutputStream
import java.io.InputStreamReader
import java.lang.Runnable
import java.lang.Thread
import java.net.InetSocketAddress
import java.net.ServerSocket

import gollom.command.handler

struct Server = { ip, port }

augment gollom.server.types.Server {
  function handle = |this, conn| {
    let reader = BufferedReader(InputStreamReader(conn: getInputStream()))
    let writer = DataOutputStream(conn: getOutputStream())

    try {
      while not reader: ready() {}

      CommandHandler(reader, writer): handle()
      writer: close()
    } catch (e) {
      e: printStackTrace()
    }
  }

  function run = |this| {
    let socket = InetSocketAddress(this: ip(), this: port())
    let server = ServerSocket()

    server: bind(socket)

    println("Listening on " + this: ip() + ":" + this: port())
    println("Press Ctrl+C to stop...")

    while(true) {
      let client  = server: accept()
      let process = Thread({ this: handle(client) }: to(Runnable.class))

      process: start()
    }
  }
}
