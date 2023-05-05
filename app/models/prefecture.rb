class Prefecture < ApplicationRecord
  has_many:post_shogi_place,dependent: :destroy
end
