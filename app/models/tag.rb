class Tag < ApplicationRecord
  has_many:taggings,         dependent: :destroy,foreign_key:'tag_id'
  has_many:post_shogi_place, through: :taggings

  validates:name,presence:true,uniqueness:true



end
