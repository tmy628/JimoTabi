class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :ensure_normal_user, only: %i[edit update]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
    # ユーザーに関連づけられた投稿のみ、@postsに渡す
    @tag_list = Tag.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def like
    @user = User.find(params[:id])
    @likes = @user.likes.includes(post: :user).page(params[:page]).reverse_order
    # どのユーザーがどの投稿をお気に入りしているか
    @tag_list = Tag.all
  end

  def ensure_normal_user
    if current_user.email == 'guest@example.com'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  # ログインユーザーでなければユーザー情報の編集・削除ができないように権限を設定する
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
