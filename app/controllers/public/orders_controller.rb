class Public::OrdersController < ApplicationController
  def new
    @order.new
  end

  def confirm
    @customer = current_customer
  end

  def complete
    @customer = current_customer
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
end
