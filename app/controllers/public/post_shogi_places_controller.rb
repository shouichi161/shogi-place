class Public::PostShogiPlacesController < ApplicationController
  def new
    @post_shogi_place=PostShogiPlace.new
  end

  def create
    @post_shogi_place=PostShogiPlace.new(post_shogi_place_params)
    @post_shogi_place.customer_id=current_customer.id
    @post_shogi_place.save!
      redirect_to post_shogi_place_path(@post_shogi_place.id)

  end

  def index
  end

  def show
    @post_shogi_place=PostShogiPlace.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_shogi_place_params
    params.require(:post_shogi_place).permit(:customer_id,:prefecture_id,:name,:address,:latitude,:longiture,:telephone_number,:explanation,:target,:activity,activity_ids: [])
  end
end
