class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      # 登録できた時
      redirect_to admin_items_index_path
    else
      # 登録できなかった時
      @items = Item.all
      render :index
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active)
  end

end