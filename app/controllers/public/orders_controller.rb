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


    if params[:order][:address_option] == 0
    #カレントカスタマーのアドレスと名前と郵便番号を＠オーダーに入れる
      @order = current_customer.adderess.name.postal_code
    elsif params[:order][:address_option] == 1
      @order = order_params.id
    #idがparams[:order][:address_id]のアドレステーブルのレコードの中身を＠オーダーに入れる
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
    @order.current_customer
  end

  def show
    @order.current_customer
  end

  private
  def order_params
    params.require(:order).permit(:method_of_payment, :postal_code, :adderess, :name)
  end
end
