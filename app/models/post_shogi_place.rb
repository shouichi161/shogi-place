class PostShogiPlace < ApplicationRecord
  has_many:favorites,               dependent: :destroy
  has_many:postcomments,            dependent: :destroy
  has_many:target_audiences_tag_relations, dependent: :destroy
  has_many:target_audiences,        through: :target_audiences_tag_relations
  has_many:taggings,                dependent: :destroy
  has_many:tags,                    through: :taggings
  belongs_to:customer
  belongs_to:prefecture
  attr_accessor :tag_name
  # 住所登録時と変更時にgeocoderが緯度・経度のデータを登録・更新するのに必要
  geocoded_by :address
  after_validation :geocode

  has_one_attached:shogi_place_image

  validates:prefecture_id,presence:true
  validates:name,presence:true
  validates:address,presence:true
  validates:telephone_number,presence:true
  validates:explanation,length: {minimum: 1,maximum: 255}

  def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags=self.tags.pluck(:tag_name)
    unless self.tags.nil?
  # 現在取得したタグから送られてきたタグを除いてoldtagとする
      old_tags = current_tags - sent_tags
  # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
      new_tags = sent_tags - current_tags

    #古いタグを消す
      old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
      end

    # 新しいタグを保存
      new_tags.each do |new|
      new_tagging=Tag.find_or_create_by(name: new)
        self.tags << new_tagging
      end
    end
  end

  # キーワード検索方法分岐
  def self.looks(range,word)
    if range=="対局場所名"
       @post_shogi_place=PostShogiPlace.where("name LIKE?","%#{word}%")
    else
       @post_shogi_place=PostShogiPlace.where("address LIKE?","%#{word}%")
    end
  end

  # いいねをクリックしたcustomerのidがfavoritesテーブルに存在するかどうかを調べる
  def favorited_by?(customer)
    favorites.exists?(customer_id:customer.id)
  end

  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}

  def get_shogi_place_image(width,height)
    unless shogi_place_image.attached?
      file_path=Rails.root.join('app/assets/images/no_image.jpg')
      shogi_place_image.attach(io:File.open(file_path),filename:'default-image.jpg',content_type:'image/jpeg')
    end
    shogi_place_image.variant(resize_to_limit:[width,height]).processed
  end
end