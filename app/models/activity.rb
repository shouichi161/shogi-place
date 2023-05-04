class Activity < ApplicationRecord
  has_many:activitys_tag_relations,dependent:destroy
end
