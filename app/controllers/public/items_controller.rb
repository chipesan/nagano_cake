class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :image)
  end
end
