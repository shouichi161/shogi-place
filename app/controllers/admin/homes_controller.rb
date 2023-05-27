class Admin::HomesController < ApplicationController
  def top
    @post_shogi_places=PostShogiPlace.page(params[:page])
  end
end
