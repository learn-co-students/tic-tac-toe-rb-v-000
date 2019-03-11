require 'bundler'
Bundler.require

def reload!
  load_all './config' if Dir.exist?('./config')
  load_all './app' if Dir.exist?('./app')
  load_all './lib' if Dir.exist?('./lib')
  load_all './*.rb' if Dir.entries('.').include?(/\.rb/)
end

task :console do
  puts 'Loading your application environment...'
  reload!
  puts 'Console started:'
  Pry.start
end
