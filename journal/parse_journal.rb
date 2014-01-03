file = open("journal.txt")

sleep_start = ""
sleep_end   = ""
file.each_line do |line|
  if line =~ /\d{6}/
    sleep_start = ""
    sleep_end   = ""
  elsif line =~ /\AAwake at (\d{4})\n\z/
    sleep_start = $1
  elsif line =~ /\AAsleep at (\d{4})\n\z/
    sleep_end = $1
    p "Awake at #{sleep_start}, asleep at #{sleep_end}"
  end
end

