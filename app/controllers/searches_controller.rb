class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.search(params[:search]).limit(132)
    @search = params[:search]
  end
end
