module gollom

import gollom.Server

function main = |args| {
  let ip   = args: get(0)
  let port = args: get(1): toInt()

  let server = Server(ip, port)

  server: run()
}
