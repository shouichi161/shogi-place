class ActivitysTagRelation < ApplicationRecord
  belongs_to:activity
  belongs_to:post_shogi_place
end
