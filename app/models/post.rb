class Post < ApplicationRecord
  belongs_to :user

  has_many :tags, through: :tag_maps
end
