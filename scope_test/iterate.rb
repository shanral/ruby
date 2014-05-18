1.upto(3) do |year|
  file = open('base_file.txt')
  file.each_line do |line|
    p line if line.chomp.split(',')[1] == year.to_s
  end

  file.close
end
