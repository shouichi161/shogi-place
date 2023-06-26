class Postcomment < ApplicationRecord
  belongs_to:customer
  belongs_to:post_shogi_place

  validates:comment,length: {minimum: 1,maximum: 100}
end
