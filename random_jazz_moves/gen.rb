NUMBER_OF_MOVES = ARGV[0].to_i
moves = `shuf moves.txt -n #{NUMBER_OF_MOVES}`.split("\n")

pos = 1
moves.each do |move|
  puts "#{pos}. #{move}"
  pos += 1
end
