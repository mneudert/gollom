module gollom.Server

import java.io.BufferedReader
import java.io.InputStreamReader
import java.lang.Runnable
import java.lang.Thread
import java.net.InetSocketAddress
import java.net.ServerSocket

struct Server = { ip, port }

augment gollom.Server.types.Server {
  function handle = |this, conn| {
    let reader = BufferedReader(InputStreamReader(conn: getInputStream()))

    try {
      while(true) {
        let line = reader: readLine()

        if line isnt null {
          println(line)
        }
      }
    } catch (e) {
      # ignore
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
