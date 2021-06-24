class Spot < ApplicationRecord
  # TagMapモデルのテスト時OFF
  belongs_to :post

  validates :address, presence: true

  geocoded_by :address

  # TagMapモデルのテスト時OFF
  after_validation :geocode

  # TagMapモデルのテスト時OFF
  before_save :print_address
  # バリデーションに成功し、実際にオブジェクトが保存される直前で実行

  def print_address
    pp address
    pp latitude
    pp longitude
  end
  # print_addressが実行された時、インスタンス変数のaddress・latitude・longitudeを参照
end
