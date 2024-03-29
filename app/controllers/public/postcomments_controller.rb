class Public::PostcommentsController < ApplicationController
  before_action:authenticate_customer!
  before_action:is_matching_login_customer,only:[:destroy]
  def create
    @post_shogi_place=PostShogiPlace.find(params[:post_shogi_place_id])
    @postcomment=current_customer.postcomments.new(postcomment_params)
    @postcomment.post_shogi_place_id=@post_shogi_place.id
    if @postcomment.save
       flash[:notice]="コメントを投稿しました"
       redirect_to post_shogi_place_path(@post_shogi_place)
    else
       @tags=@post_shogi_place.tags
       @target_audiences=@post_shogi_place.target_audiences
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

  def is_matching_login_customer
    postcomment=Postcomment.find(params[:id])
    unless postcomment.customer.id==current_customer.id
      redirect_to post_shogi_place_path(params[:post_shogi_place_id])
    end
  end

end
