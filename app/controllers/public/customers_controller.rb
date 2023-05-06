class Public::CustomersController < ApplicationController
  def index
    @customers=Customer.page(params[:page])
  end

  def show
    @customer=Customer.find(params[:id])
    @post_shogi_places=@customer.post_shogi_places
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    @customer=Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  def confilm
    @customer=Customer.find(current_customer.id)
  end

  def withdrawal
    customer=Customer.find(current_customer.id)
    customer.update(membership_status:"withdrawal")
    reset_session
    redirect_to root_path


  end

private

def customer_params
  params.require(:customer).permit(:name,:email,:date_of_birth,:gender,:chess_avility,:profile,:membership_status)
end

end
