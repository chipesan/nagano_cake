class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new
    @cart_items = current_customer.cart_items
    @total = 0
    @postage = 800
    @order.method_of_payment = params[:order][:method_of_payment]

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
    @order = current_customer.orders.new(order_params)
    if @order.save
      # 登録できた時
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @order_details = OrderDetail.new
        @order_details.order_id = @order.id
        @order_details.quantity = cart_item.amount
        @order_details.price = cart_item.item.price
        @order_details.item_id = cart_item.item_id
        if @order_details.save
          cart_item.destroy
        end
      end
      redirect_to public_orders_complete_path
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
    @cart_items = current_customer.cart_items
    @total = 0
    @order_details = @order.order_details
  end

  private
  def order_params
    params.require(:order).permit(:method_of_payment, :postal_code, :address, :name, :customer_id, :address_option, :address_id, :payment_amount, :postage)
  end
end
