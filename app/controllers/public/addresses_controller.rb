class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      # 登録できた時
      redirect_to admin_genres_path
    else
      # 登録できなかった時
      @addresses = Address.all
      render :index
    end
  end

  private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
