class CategoriesController < ApplicationController
  before_action :check_logged

  def index
    @categories = Category.order(created_at: :DESC)
      .paginate page: params[:page], per_page: Settings.category.per_page
  end
end
