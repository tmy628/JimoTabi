class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  attachment :profile_image

  #ゲストユーザー用のアカウント作成
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.alphanumeric(6)
      user.name = "ゲスト"
    end
  end
end
