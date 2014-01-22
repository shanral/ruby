#!/usr/bin/env ruby

file = open("journal.txt")

sleep_start = ""
sleep_end   = ""
file.each_line do |line|
  if line =~ /\A\d{6} \(\w{3}\):\n\z/
    sleep_start = ""
    sleep_end   = ""
  elsif line =~ /\AAwake at (\d{4})\n\z/
    sleep_start = $1
  elsif line =~ /\AAsleep at (\d{4})\n\z/
    sleep_end = $1
    puts "Awake at #{sleep_start}, asleep at #{sleep_end}"
    puts "#{sleep_end.to_i - sleep_start.to_i}"
  end
end

