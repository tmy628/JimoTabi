class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.includes(:user).search(params[:search]).limit(132).page(params[:page]).reverse_order
    @search = params[:search]
    @tag_list = Tag.all
  end
end
