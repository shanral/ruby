#!/usr/bin/env ruby

file = open('weather.dat')

def spread(high, low)
  return high - low
end

stack = 9999
day  = ''
file.each_line do |line|
  chunks = line.split
  if chunks [0] =~ /\d+/
    diff = spread(chunks[1].to_i, chunks[2].to_i)
    if diff < stack
      stack = diff
      day   = chunks[0]
    end
  end
end

p stack, day
