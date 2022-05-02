class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end


  def new
    @items = Item.new(genre_params)
  end

  def create
    @items = Item.new(genre_params)
    if @items.save
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

end