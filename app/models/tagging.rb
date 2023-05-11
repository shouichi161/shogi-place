class Tagging < ApplicationRecord
  belongs_to:post_shogi_place
  belongs_to:tag
end
