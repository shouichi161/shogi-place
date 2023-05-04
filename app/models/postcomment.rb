class Postcomment < ApplicationRecord
  belongs_to:customer
  belongs_to:post_shogi_place
end
