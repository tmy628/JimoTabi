class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
    # ユーザに関連づけられた投稿のみ、@postsに渡す
  end

  def edit
  end

  def update
  end
end
