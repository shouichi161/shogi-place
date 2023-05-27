class Admin::PostShogiPlacesController < ApplicationController
  def show
    @post_shogi_place=PostShogiPlace.find(params[:id])
  end

  def destroy
  end
end
