class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def confirm
    @customer = current_customer
  end

   private
  def customer_params
    params.require(:customer).permit(:customer_id, :item_id, :payment_amount, :method_of_payment, :postage, :postal_code, :address, :full_name, :full_name_kana)
  end
end
