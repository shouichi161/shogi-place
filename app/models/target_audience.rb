class TargetAudience < ApplicationRecord
  has_many:target_audiences_tag_relations,dependent: :destroy
  has_many:post_shogi_places,through: :target_audiences_tag_relations
end
