class PostShogiPlace < ApplicationRecord
  has_many:favorites,dependent:destroy
  has_many:postcomments,dependent:destroy
  has_many:activitys_tag_relations,dependent:destroy
  belongs_to:customer
  belongs_to:prefecture
end
