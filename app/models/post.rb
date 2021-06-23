class Post < ApplicationRecord
  belongs_to :user

  # TagMapモデルのテスト時OFF
  has_one :spot, dependent: :destroy

  # TagMapモデルのテスト時OFF
  accepts_nested_attributes_for :spot

  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  has_many :likes, dependent: :destroy

  attachment :image

  # TagMapモデルのテスト時OFF
  validates :image, presence: { message: 'を選択してください' }

  validates :title, presence: true
  validates :caption, presence: true, length: { maximum: 200 }

  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end

  def save_tag(sent_tags)
    # 現在存在するタグ・古いタグ・新しいタグをそれぞれ取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    # 古いタグの削除
    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    # 新しいタグの保存
    new_tags.each do |new|
      post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << post_tag
    end
  end

  def self.search(search)
    return Post.all unless search
    Post.where(['title LIKE ? OR caption LIKE ? ', "%#{search}%", "%#{search}%"])
  end
end