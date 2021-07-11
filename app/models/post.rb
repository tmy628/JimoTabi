class Post < ApplicationRecord
  belongs_to :user

  # TagMapモデルのテスト時OFF
  has_one :spot, dependent: :destroy

  # TagMapモデルのテスト時OFF
  accepts_nested_attributes_for :spot

  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  attachment :image

  # TagMapモデルのテスト時OFF
  validates :image, presence: { message: 'を選択してください' }

  validates :title, presence: true
  validates :caption, presence: true, length: { maximum: 200 }
  validates :prefecture_name, presence: true

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
    # ユーザidがLikesテーブル内に存在（exists?）するかどうかを調べる
  end

  def save_tag(sent_tags)
    # 現在存在するタグ・古いタグ・新しいタグをそれぞれ取得
    current_tags = tags.pluck(:tag_name) unless tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    # 古いタグの削除
    old_tags.each do |old|
      tags.delete Tag.find_by(tag_name: old)
    end

    # 新しいタグの保存
    new_tags.each do |new|
      post_tag = Tag.find_or_create_by(tag_name: new)
      tags << post_tag
    end
  end

  def self.search(search)
    return Post.all unless search
    Post.where(['title LIKE ? OR caption LIKE ? OR prefecture_name LIKE ? ', "%#{search}%", "%#{search}%", "%#{search}%"])
  end

  include JpPrefecture
end
