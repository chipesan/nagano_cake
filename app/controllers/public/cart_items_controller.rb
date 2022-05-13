class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer
  end

  def update
    @cart_items = Cart_item.find(params[:id])
    @cart_items.update(cart_item_params)
    redirect_to public_cartitems_index_path
  end

  def destroy
  end


  def destroy_all
  end

  def create
    @cart_items = Cart_item.new(cart_item_params)
    if @cart_item.save
      # カート内商品が追加できた時
      redirect_to public_cartitems_index_path
    else
      # カート内商品が追加できなかった時
      @cart_item = Cart_item.all
      render :index
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
