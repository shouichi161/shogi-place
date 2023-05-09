class Activity < ApplicationRecord
  has_many:activitys_tag_relations,dependent: :destroy
  has_many:post_shogi_places,through: :activitys_tag_relations
end
