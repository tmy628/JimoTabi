class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_currect_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
    # ユーザーに関連づけられた投稿のみ、@postsに渡す
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def like
    @user = User.find(params[:id])
    likes = Like.where(user_id: current_user.id).pluck(:post_id)
    # whereメソッドでlikesテーブルから自分のidが登録されているレコードを取得し、pluckメソッドで取得したレコードからpost_idを配列の形で取得
    @likes = Post.find(likes)
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
