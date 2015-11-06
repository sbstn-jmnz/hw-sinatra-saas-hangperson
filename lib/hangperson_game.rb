class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end

  attr_accessor :word, :guesses, :wrong_guesses
  
  def initialize(word)
    @word = word
    @guesses = ""
    @wrong_guesses = ""
 end

 def guess(letter)
  
  if letter == '' || letter == nil || letter.include?('%')
    raise ArgumentError
  end

   letter.downcase!
   if @word.include?(letter) && !@guesses.include?(letter)    
     @guesses << letter
    elsif @wrong_guesses.include?(letter) || @guesses.include?(letter)
     return false
    else
      @wrong_guesses << letter
    end

 end

def word_with_guesses
  string = ''
  @word.each_char do |l|
    if @guesses.include? l
      string << l
    else
      string << '-'
    end
  end
  return string
end

def check_win_or_lose
  if @word.length == @guesses.length
    :win
   elsif @wrong_guesses.length >= 7
    :lose 
    else
    :play 
  end
end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
