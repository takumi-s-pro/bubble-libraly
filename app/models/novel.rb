class Novel < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 1000 }

  scope :active, -> { where('expires_at > ?', Time.current) }
end
