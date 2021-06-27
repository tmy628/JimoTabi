class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  attachment :profile_image, destroy: false
  # destroyオプションを渡してアップロードしたファイルを保持する

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

  # ゲストユーザー用のアカウント作成
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.alphanumeric(6)
      user.name = "ゲスト"
      user.introduction = 'ようこそ「じもたび」へ。ゲストユーザーは、ユーザー情報の編集・削除機能を制限しております。'
    end
  end
end
