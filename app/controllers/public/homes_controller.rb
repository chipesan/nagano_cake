class Public::HomesController < ApplicationController
  def top
    @items = Item.all.page(params[:page])
  end
  def about
  end
end
