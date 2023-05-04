class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many:post_shogi_places,dependent:destroy
  has_many:postcomments,dependent:destroy
  has_many:favorites,dependent:destroy
end
