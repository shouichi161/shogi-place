class Public::FavoritesController < ApplicationController
  def create
    post_shogi_place=PostShogiPlace.find(params[:post_shogi_place_id])
    favorite=current_customer.favorites.new(post_shogi_place_id:post_shogi_place.id)
    favorite.save
    redirect_to post_shogi_place_path(post_shogi_place)
  end

  def destroy
    post_shogi_place=PostShogiPlace.find(params[:post_shogi_place_id])
    favorite=current_customer.favorites.find_by(post_shogi_place_id:post_shogi_place.id)
    favorite.destroy
    redirect_to post_shogi_place_path(post_shogi_place)
  end
end
