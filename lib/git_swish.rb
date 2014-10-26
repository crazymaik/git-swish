libs = File.expand_path("../lib", File.dirname(__FILE__))
$:.unshift *Dir.glob(libs)

module Git
end

require "git_swish/version"
require 'git_swish/app'

begin
  Git::Swish::App.new(ARGV).run()
rescue => err
  puts ("ERROR:  #{err.to_s}")
end
