class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def show
    @novels = @user.novels.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "プロフィールを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # 自分のプロフィールしか編集できないように制限
  def correct_user
    redirect_to root_path, alert: "権限がありません。" unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:profile)
  end
end