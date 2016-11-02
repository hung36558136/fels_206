class WordsController < ApplicationController
  before_action :check_logged

  def index
    @categories = Category.all
    @words = Word.select(:id, :content)
      .paginate page: params[:page], per_page: Settings.words.per_page
    @words_answers = Word.all.map do |word|
      [word.content, word.answers.where(is_correct: true).first.content]
    end
  end
end
