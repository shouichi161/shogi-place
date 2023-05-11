class Tag < ApplicationRecord
  has_many:taggings,         dependent: :destroy
  has_many:post_shogi_place, through: :taggings
end
