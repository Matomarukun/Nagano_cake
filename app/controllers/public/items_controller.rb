class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all
  end


  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new(item_id: @item.id)
  end

end