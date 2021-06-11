class Post < ApplicationRecord
  belongs_to :user

  has_one :spot, dependent: :destroy

  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  has_many :likes, dependent: :destroy

  attachment :image

  validates :image, presence: true, presence: { message: 'を選択してください' }
  validates :title, presence: true
  validates :caption, presence: true, length: { maximum: 200 }

  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end