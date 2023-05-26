class Admin::PostcommentsController < ApplicationController
  def destroy
    postcomment=Postcomment.find(params[:id])
    postcomment.destroy
    redirect_to admin_post_shogi_place_path(params[:post_shogi_place_id])
  end
end
