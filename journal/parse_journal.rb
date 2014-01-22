#!/usr/bin/env ruby

file = open("journal.txt")

time_awake = []
time_sleep = []
file.each_line do |line|
  if line =~ /\AAwake at (\d{4})\n\z/
    time_awake << $1
  elsif line =~ /\AAsleep at (\d{4})\n\z/
    time_sleep << $1
  end
end

p time_awake
p time_sleep
