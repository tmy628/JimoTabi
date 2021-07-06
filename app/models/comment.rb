class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :post

  validates :content, presence: true
  # 空欄のまま送信できないように設定
end
