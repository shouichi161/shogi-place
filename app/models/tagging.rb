class Tagging < ApplicationRecord
  belongs_to:post_shogi_place
  belongs_to:tag

  validates:post_shogi_place_id,presence:true
  validates:tag_id,presence:true


end
