class TargetAudience < ApplicationRecord
  has_many:post_shogi_places,dependent: :destroy,foreign_key: 'tag_id'
  has_many:post_shogi_places,through: :target_audiences_tag_relations
end
