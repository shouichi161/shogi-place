class Public::PostShogiPlacesController < ApplicationController
  def new
    @post_shogi_place=PostShogiPlace.new
  end

  def create
    @post_shogi_place=PostShogiPlace.new(post_shogi_place_params)
    @post_shogi_place.customer_id=current_customer.id
    # 受け取った値を、で区切って配列にする
    tag_list=params[:post_shogi_place][:tag_name].split('、')
    if @post_shogi_place.save
       @post_shogi_place.save_tag(tag_list)
       flash[:notice]="投稿に成功しました"
       redirect_to post_shogi_place_path(@post_shogi_place.id)
    else
       render:new
    end
  end

  def index
    @post_shogi_places=params[:target_audience_id].present? ? TargetAudience.find(params[:target_audience_id]).post_shogi_places.page(params[:page]) : PostShogiPlace.page(params[:page])
    @tags=Tag.all
  end

  def show
    @post_shogi_place=PostShogiPlace.find(params[:id])
    @tags=@post_shogi_place.tags
    @postcomments=@post_shogi_place.postcomments.page(params[:page])
    @postcomment=Postcomment.new
  end

  def edit
    @post_shogi_place=PostShogiPlace.find(params[:id])
    @tag_list=@post_shogi_place.tags.pluck(:name).join('、')
  end

  def update
    @post_shogi_place=PostShogiPlace.find(params[:id])
    # 入力されたタグを受け取る
    tag_list=params[:post_shogi_place][:tag_name].split('、')
    if @post_shogi_place.update(post_shogi_place_params)
      # @post_shogi_place_idに紐づいていたタグを@oldに入れる
       @old_relations=Tagging.where(post_shogi_place_id: @post_shogi_place.id)
      # @oldの中身を取り出し、消す
       @old_relations.each do |relation|
         relation.delete
       end
       @post_shogi_place.save_tag(tag_list)
       flash[:notice]="更新に成功しました"
       redirect_to post_shogi_place_path(@post_shogi_place.id)
    else
      @tag_list=@post_shogi_place.tags.pluck(:name).join('、')
      render:edit
    end
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
    @post_shogi_places=@tag.post_shogi_place.page(params[:page])
  end

  private

  def post_shogi_place_params
    params.require(:post_shogi_place).permit(:customer_id,:prefecture_id,:name,:address,:latitude,:longiture,:telephone_number,:explanation,:shogi_place_image,tags_attributes: [:name],target_audience_ids: [])
  end

end
