require 'minitest/autorun'

class WordCount
  def initialize(file)
    @file = file.gsub(/['"]/, '')
  end

  def text_array
    @file.scan(/\w+/)
  end

  def raw_word_count
    text_array.group_by { |word| word.downcase }.map { |k, v| [k, v.size] }
  end

  def sorted_word_count
    raw_word_count.sort_by{ |k| k[1] }.reverse
  end
end


describe WordCount do
  it 'should create an accurate array of the given text' do
    example = WordCount.new('aaa aa a a a')
    example.text_array.must_equal ['aaa', 'aa', 'a', 'a', 'a']
  end

  it 'should create an accurate unsorted word count array' do
    example = WordCount.new('aaa aa a a a')
    example.raw_word_count.must_equal [['aaa', 1], ['aa', 1], ['a', 3]]
  end

  it 'should create an accurate sorted array' do
    example = WordCount.new('aaa aa a a a')
    example.sorted_word_count.must_equal [['a', 3], ['aa', 1], ['aaa', 1]]
  end

  it 'should create and accurate unsorted array' do
    example = WordCount.new(%-won't can"t wont cant-)
    example.raw_word_count.must_equal [['wont', 2], ['cant', 2]]
  end
end
