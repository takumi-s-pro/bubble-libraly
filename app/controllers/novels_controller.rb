class NovelsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @novels = Novel.active.order(created_at: :desc)
  end

  def show
    @novel = Novel.find(params[:id])
    redirect_to root_path, alert: 'この小説は表示できません。' if @novel.expires_at <= Time.current
  end

  def new
    @novel = current_user.novels.build
  end

  def create
    @novel = current_user.novels.build(novel_params)
    # 投稿から24時間で非表示にする例
    @novel.expires_at = 24.hours.from_now

    if @novel.save
      redirect_to @novel, notice: '小説を投稿しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def novel_params
    params.require(:novel).permit(:title, :content)
  end
end
