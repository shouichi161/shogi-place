class Public::PostcommentsController < ApplicationController
  def create
    post_shogi_place=PostShogiPlace.find(params[:post_shogi_place_id])
    comment=current_customer.postcomments.new(postcomment_params)
    comment.post_shogi_place_id=post_shogi_place.id
    comment.save
    redirect_to post_shogi_place_path(post_shogi_place)
  end

  def destroy
    postcomment=Postcomment.find(params[:id])
    postcomment.destroy
    redirect_to post_shogi_place_path(params[:post_shogi_place_id])
  end

  private

  def postcomment_params
    params.require(:postcomment).permit(:post_shogi_place_id,:customer_id,:comment)
  end

end
