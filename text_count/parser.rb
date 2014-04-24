require 'minitest/autorun'

class WordCount

  def initialize(file)
    @file = file
  end

  def raw_word_count
    @file.scan(/\w+/).group_by { |word| word.downcase }.map { |k, v| [k, v.size] }
  end

  def sorted_word_count
    raw_word_count.sort_by{ |k| k[1] }.reverse
  end
end


describe WordCount do
  let(:ex1) { WordCount.new('aaa aa a a a') }

  it "should create an accurate unsorted array" do
    ex1.raw_word_count.must_equal [['aaa', 1], ['aa', 1], ['a', 3]]
  end

  it "should create an accurate sorted array" do
    ex1.sorted_word_count.must_equal [['a', 3], ['aa', 1], ['aaa', 1]]
  end

  let(:ex2) { WordCount.new("can't won't wont cant") }
  # how to handle these...
end
