require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
   @letters = [*('A'..'Z')].sample(10)

  end

  def score
    @word = params[:word]
    @letters = params[:letters]
    result = []

# test if word is English
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    dict = open(url).read
    word = JSON.parse(dict)
    @word_in_dict = word["found"]



     @word.each_char do |c|
      result << @letters.include?(c)
      end

      if result.include?(false)
        #perdu
        @solution = "sorry #{@word} cant be built out of #{@letters}"
      else
      #gagné
      @solution = "bravo #{@word} is built out of #{@letters}"
      end
  end

end
