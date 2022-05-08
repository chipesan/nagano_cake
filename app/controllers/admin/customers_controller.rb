class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active)
  end

end
