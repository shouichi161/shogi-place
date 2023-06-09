class Admin::PostShogiPlacesController < ApplicationController
  before_action:authenticate_admin!
  def show
    @post_shogi_place=PostShogiPlace.find(params[:id])
    @tags=@post_shogi_place.tags
    @target_audiences=@post_shogi_place.target_audiences
    @postcomments=@post_shogi_place.postcomments.page(params[:page])
  end

  def destroy
    post_shogi_place=PostShogiPlace.find(params[:id])
    post_shogi_place.destroy
    redirect_to admin_path
  end

  def search_tag
    @tags=Tag.all
    @tag=Tag.find(params[:tag_id])
    @post_shogi_places=@tag.post_shogi_place.page(params[:page])
  end

  def search_keyword
    @post_shogi_places=PostShogiPlace.looks(params[:range],params[:word]).page(params[:page])
  end

  def multi_criteria_search
    @prefecture=Prefecture.find(params[:prefecture_id])
    @target_audience=TargetAudience.find(params[:target_audience_id])
    @post_shogi_places=PostShogiPlace.joins(:target_audiences).where("post_shogi_places.prefecture_id LIKE ? AND target_audiences.id LIKE ?","#{params[:prefecture_id]}","#{params[:target_audience_id]}").page(params[:page])
  end
end
