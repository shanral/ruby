NUMBER_OF_MOVES = ARGV[0].to_i
moves = `shuf moves.txt -n #{NUMBER_OF_MOVES}`.split("\n")
moves.each { |move| puts ">> #{move}" }
