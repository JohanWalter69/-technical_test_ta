class PartiesController < ApplicationController
  before_action :authenticate_user!

  def new
    # affiche une nouvelle grille et un formulaire
    @ten_letters_list = (0...10).map { ('a'..'z').to_a[rand(26)] }
  end

  def results
    @word = params[:word].upcase
    @ten_letters_list = params[:letters]
    @score_results = included?(@word, @ten_letters_list)
    if @score_results == true
      "You score is: #{@word.length}"
    else
      false
    end
  end

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

end
