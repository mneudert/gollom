task :default do
  system("rake -sT")
end

desc "Run"
task :run, :ip, :port do |t, args|
  ip   = args[:ip]   || "127.0.0.1"
  port = args[:port] || 6380

  libs = Dir.glob("src/main/gollom/**/*.golo") * " "

  sh "golo golo --files #{libs} src/main/gollom.golo --args #{ip} #{port}"
end
