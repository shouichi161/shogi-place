class Admin::CustomersController < ApplicationController
  def index
    @customers=Customer.page(params[:page])
  end

  def show
    @customer=Customer.find(params[:id])
    @post_shogi_places=@customer.post_shogi_places.page(params[:page])
    @postcomments=@customer.postcomments.page(params[:page])
  end

  def edit
  end

  def update
  end
end
