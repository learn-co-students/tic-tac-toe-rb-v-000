require 'bundler'
Bundler.require

def reload!
  load_all "./config" if Dir.exists?("./config")
  load_all "./bin" if Dir.exists?("./bin")
  load_all "./lib" if Dir.exists?("./lib")
  load_all "./*.rb" if Dir.entries(".").include?(/\.rb/)
end

task :console do
  puts "Loading your application environment..."
  reload!
  puts "Console started:"
  Pry.start
end
