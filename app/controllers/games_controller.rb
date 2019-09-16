class GamesController < ApplicationController
  def new
    i = [('A'..'Z')].map(&:to_a).flatten
    @letters = (0..9).map { i[rand(i.length)] }
  end

  def score
    if english_word?
      @result = 'It is a real word!'
    else
      @result = 'Please enter an English word.'
    end
  end

  def english_word?
    response = open("https://wagon-dictionary.herokuapp.com/#{params[:word]}")
    word = JSON.parse(response.read)
    word['found']
  end
end
