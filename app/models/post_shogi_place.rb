class PostShogiPlace < ApplicationRecord
  has_many:favorites,dependent: :destroy
  has_many:postcomments,dependent: :destroy
  has_many:activitys_tag_relations,dependent: :destroy
  belongs_to:customer
  belongs_to:prefecture

  has_one_attached:shogi_place_image

  def get_shogi_place_image
    unless shogi_place_image.attached?
      file_path=Rails.root.join('app/assets/images/no_image.jpg')
      shogi_place_image.attach(io:File.open(file_path),filename:'default-image.jpg',content_type:'image/jpeg')
    end
    shogi_place_image.variant(resize_to_limit:[width,height]).processed
  end
end
