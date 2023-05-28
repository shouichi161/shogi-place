class Admin::HomesController < ApplicationController
  before_action:authenticate_admin!
  def top
    @post_shogi_places=PostShogiPlace.page(params[:page])
    @tags=Tag.all
  end
end
