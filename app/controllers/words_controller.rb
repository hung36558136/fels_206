class WordsController < ApplicationController
  include SessionsHelper
  def index
    @categories = Category.all
    @words = Word.with_correct_answer
      .paginate page: params[:page], per_page: Settings.word.per_page
  end

  def create
    @categories = Category.all
    if params[:status] == "all"
      if params[:category_id] != ""
        @words = Word.filter_word_by_category(params[:category_id])
        render "new"
      else
        @words = Word.with_correct_answer
          .paginate page: params[:page], per_page: Settings.word.per_page
        render "index"
      end
    elsif params[:status] == "learned"
      if params[:category_id] == ""
        @words = Result.filter_word_learned(current_user.id)
        render "new"
      else
        @words = Result.filter_word_learned_with_category(current_user.id,
          params[:category_id])
        render "new"
      end
    end
  end
end
