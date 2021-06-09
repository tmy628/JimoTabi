class Post < ApplicationRecord
  belongs_to :user

  has_one :spot, dependent: :destroy

  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  has_many :likes, dependent: :destroy

  attachment :image

  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end