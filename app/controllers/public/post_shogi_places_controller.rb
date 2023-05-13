class Public::PostShogiPlacesController < ApplicationController
  def new
    @post_shogi_place=PostShogiPlace.new
  end

  def create
    @post_shogi_place=PostShogiPlace.new(post_shogi_place_params)
    @post_shogi_place.customer_id=current_customer.id
    # 受け取った値を、で区切って配列にする
    tag_list=params[:post_shogi_place][:tag_name].split('、')
    @post_shogi_place.save
    @post_shogi_place.save_tag(tag_list)
    redirect_to post_shogi_place_path(@post_shogi_place.id)

  end

  def index
    @post_shogi_places=params[:activity_id].present? ? Activity.find(params[:activity_id]).post_shogi_places.page(params[:page]) : PostShogiPlace.page(params[:page])
    @tags=Tag.all
  end

  def show
    @post_shogi_place=PostShogiPlace.find(params[:id])
    @tags=@post_shogi_place.tags
  end

  def edit
  end

  def update
  end

  def destroy
    post_shogi_place=PostShogiPlace.find(params[:id])
    post_shogi_place.destroy
    flash[:notice]="投稿を削除しました"
    redirect_to customer_path(current_customer.id)

  end

  def search_tag
    @tags=Tag.all
    @tag=Tag.find(params[:tag_id])
    @post_shogi_places=@tag.post_shogi_places.page(params[:page])
  end

  private

  def post_shogi_place_params
    params.require(:post_shogi_place).permit(:customer_id,:prefecture_id,:name,:address,:latitude,:longiture,:telephone_number,:explanation,:target,tags_attributes: [:name],activity_ids: [])
  end

end
