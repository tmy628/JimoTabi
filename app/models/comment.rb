class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :post_id

  validates :content, presence: true
  # 空欄のまま送信できないように設定
end
