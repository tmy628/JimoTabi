class Post < ApplicationRecord
  belongs_to :user

  has_one :spot, dependent: :destroy
  accepts_nested_attributes_for :spot

  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  has_many :likes, dependent: :destroy

  attachment :image

  validates :image, presence: { message: 'を選択してください' }
  validates :title, presence: true
  validates :caption, presence: true, length: { maximum: 200 }

  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end

  def save_tag(sent_tags)
    # 現在存在するタグ・古いタグ・新しいタグをそれぞれ取得
    current_tags = salf.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    # 古いタグの削除
    old_tags.each do |old|
      self.post_tags.delete PostTag.find_by(tag_name: old)
    end

    # 新しいタグの保存
    new_tags.each do |new|
      new_post_tag = PostTag.find_or_create_by(tag_name: new)
      self.post_tags << new_post_tag
    end
  end
end