class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:genre_id, :name, :introduction, :price, :is_active)
  end
end
