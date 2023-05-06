class Public::CustomersController < ApplicationController
  def index
  end

  def show
    @customer=Customer.find(params[:id])
    @post_shogi_places=@customer.post_shogi_places
  end

  def edit
  end

  def update
  end

  def confilm
  end

  def withdrawal
  end

end
