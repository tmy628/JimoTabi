class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.search(params[:search]).limit(132)
    @search = params[:search]
    @searches = Post.page(params[:page]).reverse_order
    @tag_list = Tag.all
  end
end
