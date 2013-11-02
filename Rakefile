task :default do
  system("rake -sT")
end

desc "Run"
task :run do
  Dir.chdir("src/main/gollom")
  sh "golo golo --files main.golo"
end