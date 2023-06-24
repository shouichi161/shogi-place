class Public::PostShogiPlacesController < ApplicationController
  before_action:authenticate_customer!
  before_action:is_matching_login_customer,only:[:edit,:update,:destroy]

  def new
    @post_shogi_place=PostShogiPlace.new
  end

  def create
    @post_shogi_place=PostShogiPlace.new(post_shogi_place_params)
    @post_shogi_place.customer_id=current_customer.id
    if @post_shogi_place.geocode.nil?
      @post_shogi_place.errors.add(:base, '緯度経度が取得できませんでした')
      return render:new
    end
    # 対象者が存在していない時の処理
    unless @post_shogi_place.target_audience_ids.present?
      @post_shogi_place.errors.add(:base, '対象者を選択してください')
      return render:new
    end
    # タグが存在していない時の処理
    unless params[:post_shogi_place][:tag_name].present?
      @post_shogi_place.errors.add(:base, 'タグを入れてください')
      return render :new
    end
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
    if params[:latest]
      @post_shogi_places=PostShogiPlace.latest.page(params[:page])
    elsif params[:old]
      @post_shogi_places=PostShogiPlace.old.page(params[:page])
    else
      @post_shogi_places=PostShogiPlace.page(params[:page])
    end
    @tags=Tag.all
  end

  def show
    @post_shogi_place=PostShogiPlace.find(params[:id])
    @tags=@post_shogi_place.tags
    @target_audiences=@post_shogi_place.target_audiences
    @postcomments=@post_shogi_place.postcomments.page(params[:page])
    @postcomment=Postcomment.new
  end

  def edit
    @post_shogi_place=PostShogiPlace.find(params[:id])
    @prefecture_id=@post_shogi_place.prefecture.id
    @tag_list=@post_shogi_place.tags.pluck(:name).join('、')
  end

  def update
    @post_shogi_place=PostShogiPlace.find(params[:id])
     # タグが存在していない時の処理
    unless params[:post_shogi_place][:tag_name].present?
      @post_shogi_place.errors.add(:base, 'タグを入れてください')
      @tag_list=@post_shogi_place.tags.pluck(:name).join('、')
      return render :edit
    end
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

  def search_keyword
    @post_shogi_places=PostShogiPlace.looks(params[:range],params[:word]).page(params[:page])
  end

  def multi_criteria_search
    @prefecture=Prefecture.find(params[:prefecture_id])
    @target_audience=TargetAudience.find(params[:target_audience_id])
    @post_shogi_places=PostShogiPlace.joins(:target_audiences).where("post_shogi_places.prefecture_id LIKE ? AND target_audiences.id LIKE ?","#{params[:prefecture_id]}","#{params[:target_audience_id]}").page(params[:page])
  end

  private

  def post_shogi_place_params
    params.require(:post_shogi_place).permit(:customer_id,:prefecture_id,:name,:address,:latitude,:longiture,:telephone_number,:explanation,:shogi_place_image,tags_attributes: [:name],target_audience_ids: [])
  end


  def is_matching_login_customer
    post_shogi_place=PostShogiPlace.find(params[:id])
    unless post_shogi_place.customer.id==current_customer.id
      redirect_to post_shogi_places_path
    end
  end

end
