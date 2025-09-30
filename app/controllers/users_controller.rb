class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!, only: [:show]

  def show
    @novels = @user.novels.order(created_at: :desc)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end