class Admin::HomesController < ApplicationController
  before_action:authenticate_admin!
  def top
    if params[:latest]
      @post_shogi_places=PostShogiPlace.latest.page(params[:page])
    elsif params[:old]
      @post_shogi_places=PostShogiPlace.old.page(params[:page])
    else
      @post_shogi_places=PostShogiPlace.page(params[:page])
    end

    @tags=Tag.all
  end
end
