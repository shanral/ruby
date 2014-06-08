NUMBER_OF_MOVES = ARGV[0].to_i
URL = "/home/ubuntu/programming/ruby/random_jazz_moves/moves.txt"

moves = `shuf #{URL} -n #{NUMBER_OF_MOVES}`
moves.split("\n").each { |move| puts ">> #{move}" }
