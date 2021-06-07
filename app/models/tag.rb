class Tag < ApplicationRecord
  has_many :posts, through: :tag_maps
end
