#!/usr/bin/env ruby

f = File.read(ARGV[0])

output = f.scan(/\w+/).group_by{ |word| word.downcase }.map { |k, v| [k, v.size]}
output.sort_by!{ |k| k[1] }.reverse!

file = File.new('output.txt', 'w')
output.each do |word|
  file.write("#{word[1]}, #{x[0]}\n")
end

