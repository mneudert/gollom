task :default do
  system("rake -sT")
end

desc "Run"
task :run, :ip, :port do |t, args|
  ip   = args[:ip]   || "127.0.0.1"
  port = args[:port] || 6379

  sh "golo golo --files src/ --module gollom --args #{ip} #{port}"
end

desc "Run (vanilla-golo)"
task :vanilla, :ip, :port do |t, args|
  ip   = args[:ip]   || "127.0.0.1"
  port = args[:port] || 6379

  sh "vanilla-golo golo --files src/ --module gollom --args #{ip} #{port}"
end
