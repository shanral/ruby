require 'time'


file = open('journal.txt')

date        = []
time_awake  = []
time_asleep = []

file.each_line do |line|
  line.chomp!
  if line =~ /\A\d{8} \(\w{3}\):\z/
    date << line[0..7]
  elsif line =~ /\AAwake at \d{4}\z/
    time_awake << line[-4..-1]
  elsif line =~ /\AAsleep at \d{4}\z/
    time_asleep <<  line[-4..-1]
  end
end

output_dates = []
output_sleep = []
0.upto(date.length - 1) do |index|
  curr_date   = date[index]
  curr_asleep = time_asleep[index]
  curr_awake  = time_awake[index + 1]

  next if curr_awake.nil? # won't work for first entry in journal

  if curr_asleep[0] != '0'
    first_bit  = 2400 - curr_asleep.to_i
    second_bit = curr_awake.to_i
    time_slept = first_bit + second_bit
    time_slept = time_slept + 40 if time_slept.to_s[-2].to_i >= 6
    output_dates << curr_date
    output_sleep << time_slept.to_s
  else
    time_slept = curr_awake.to_i - curr_asleep.to_i
    time_slept = time_slept + 40 if time_slept.to_s[-2].to_i >= 6
    output_dates << curr_date
    output_sleep << time_slept.to_s
  end
end

out_file = File.new('output.csv', 'w')
out_file.write "date,amount_slept\n"

0.upto(output_dates.length - 1) do |index|
  out_date = output_dates[index]
  out_date = out_date[0,4] + "/" + out_date[4, 2] + "/" + out_date[6,2]
  out_file.write "#{out_date},#{output_sleep[index]}\n"
end

file.close
out_file.close
