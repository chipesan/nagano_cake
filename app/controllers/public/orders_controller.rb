class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @total = 0
    @postage = 800

    if params[:order][:address_option] == "0"
    #カレントカスタマーのアドレスと名前と郵便番号を＠オーダーに入れる
    puts "0!!!"
    @customer = current_customer
    @order.name = @customer.last_name + @customer.first_name
    @order.postal_code = @customer.postal_code
    @order.address = @customer.address
    elsif params[:order][:address_option] == "1"
    #idがparams[:order][:address_id]のアドレステーブルのレコードの中身を＠オーダーに入れる
    puts "1!!!"
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    else
    puts "2!!!"
    @address = Address.new
    @addresses = Address.all
    end
  end

  def complete
    @order = current_customer
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      # 登録できた時
      redirect_to public_orders_confirm_path
    else
      # 登録できなかった時
    @orders = Order.all
      render :new
    end
  end

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:method_of_payment, :postal_code, :address, :name)
  end
end
