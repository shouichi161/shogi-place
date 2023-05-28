class Admin::PostcommentsController < ApplicationController
  before_action:authenticate_admin!
  def destroy
    postcomment=Postcomment.find(params[:id])
    postcomment.destroy
    flash[:notice]="コメントを削除しました。"
    redirect_to admin_post_shogi_place_path(params[:post_shogi_place_id])
  end
end
