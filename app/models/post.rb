class Post < ApplicationRecord
  belongs_to :user

  has_one :spot, dependent: :destroy

  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
end
