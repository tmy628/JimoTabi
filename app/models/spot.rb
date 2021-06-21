class Spot < ApplicationRecord
  belongs_to :post

  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode

  before_save :print_address
  # バリデーションに成功し、実際にオブジェクトが保存される直前で実行

  def print_address
    pp self.address
    pp self.latitude
    pp self.longitude
  end
  # print_addressが実行された時、インスタンス変数のaddress・latitude・longitudeを参照
end
