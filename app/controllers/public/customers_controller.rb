class Public::CustomersController < ApplicationController
  before_action:authenticate_customer!
  before_action :ensure_normal_customer,only: [:update,:withdrawal]
  before_action :is_matching_login_customer,only:[:edit,:update]

  def index
    @customers=Customer.page(params[:page])
  end

  def show
    @customer=Customer.find(params[:id])
    @post_shogi_places=@customer.post_shogi_places.page(params[:page]).per(5)
    @favorites=@customer.favorites.page(params[:page]).per(5)
    @postcomments=@customer.postcomments.page(params[:page]).per(5)
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    @customer=Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice]="更新に成功しました"
      redirect_to customer_path(@customer.id)
    else
      render:edit
    end
  end

  def confilm
    @customer=Customer.find(current_customer.id)
  end

  def withdrawal
    customer=Customer.find(current_customer.id)
    customer.update(membership_status:"withdrawal")
    reset_session
    flash[:notice]="退会しました。"
    redirect_to root_path
  end

  # ゲストユーザーはユーザー情報の更新、退会をできなくする
  def ensure_normal_customer
    if current_customer.name=='ゲストユーザー'
      flash[:notice]="ゲストユーザーの更新・退会はできません"
      redirect_to root_path
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name,:email,:date_of_birth,:gender,:chess_ability,:profile,:membership_status,:customer_image)
  end

  def is_matching_login_customer
    customer=Customer.find(params[:id])
    unless customer.id==current_customer.id
    redirect_to customers_path
    end
  end
end
