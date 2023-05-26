class Public::PostcommentsController < ApplicationController
  def create
    @post_shogi_place=PostShogiPlace.find(params[:post_shogi_place_id])
    @postcomment=current_customer.postcomments.new(postcomment_params)
    @postcomment.post_shogi_place_id=@post_shogi_place.id
    if @postcomment.save
       flash[:notice]="コメントを投稿しました"
       redirect_to post_shogi_place_path(@post_shogi_place)
    else
       @tags=@post_shogi_place.tags
       @postcomments=@post_shogi_place.postcomments.page(params[:page])
       render:'public/post_shogi_places/show'
    end
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
