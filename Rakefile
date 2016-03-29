task :default do
  system("rake -sT")
end

desc "Run"
task :run, :ip, :port do |t, args|
  ip   = args[:ip]   || "127.0.0.1"
  port = args[:port] || 6380

  sh "golo golo --files src/ --module gollom --args #{ip} #{port}"
end
