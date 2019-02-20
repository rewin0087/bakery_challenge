require 'byebug'
Dir['lib/**/*.rb'].each do |file|
  require File.join(File.dirname(__dir__), file)
end