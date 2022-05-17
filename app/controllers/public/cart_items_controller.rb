class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def update
    @cart_items = CartItem.find(params[:id])
    @cart_items.update(cart_item_params)
    redirect_to public_cart_items_index_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_index_path
  end


  def destroy_all
    @cart_items = current_customer.cart_items.destroy_all
    cart_items.destroy_all

  end

  def create
    @cart_items = CartItem.new(cart_item_params)
    @cart_items.customer_id = current_customer.id
    if @cart_items.save!
      # カート内商品が追加できた時
      redirect_to public_cart_items_index_path
    else
      # カート内商品が追加できなかった時
      @cart_item = CartItem.all
      render :index
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
