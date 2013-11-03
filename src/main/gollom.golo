module gollom

import gollom.server

function main = |args| {
  let ip   = args: get(0)
  let port = args: get(1): toInt()

  let server = Server(ip, port, map[])

  server: run()
}
