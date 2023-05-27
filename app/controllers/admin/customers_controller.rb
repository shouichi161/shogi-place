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
    @customer=Customer.find(params[:id])
  end

  def update
    @customer=Customer.find(params[:id])
    if @customer.update(customer_params)
       flash[:notice]="会員情報を更新しました。"
       redirect_to admin_customer_path(@customer.id)
    else
       render:edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name,:email,:date_of_birth,:gender,:chess_ability,:profile,:membership_status)
  end
end
