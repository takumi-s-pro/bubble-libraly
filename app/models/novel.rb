class Novel < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  #validates :expires_at, presence: true

  # 保存前に公開期限を補正
  before_validation :set_default_expires_at, on: :create

  private

  def set_default_expires_at
    # expires_at が未設定 or 過去の時間なら、現在から24時間後を設定
    if expires_at.blank? || expires_at <= Time.current
      self.expires_at = 24.hours.from_now
    end
  end
end