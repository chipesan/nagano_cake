class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def confirm
    @customer = Customer.find(params[:id])
  end

   private
  def customer_params
    params.require(:customer).permit(:customer_id, :item_id, :payment_amount, :method_of_payment, :postage, :postal_code, :address, :name)
  end
end
