#! /usr/bin/env ruby

desc "Run tests."
task :test do
  require_relative 'pentagonal_test.rb'
end

desc "Run PentagonalFinder."
task :find, :debug do |t,args|
  require_relative 'pentagonal_finder.rb'
  reset = "\r\e[0K"

  finder = PentagonalFinder.new
  result = args[:debug] != "true" ? finder.run : finder.run {|status| print "#{reset}j = #{status.j}, k = #{status.k}, d = #{status.d}" }

  print reset
  puts "Result:"
  puts "  j = #{result.j}"
  puts "  k = #{result.k}"
  puts "  d = #{result.d}"
end

task :default => :test