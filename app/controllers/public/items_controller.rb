class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :image)
  end
end
