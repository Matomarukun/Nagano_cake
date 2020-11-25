class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_params)
    redirect_to cart_items_path(@cart_item)
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_item_path(cart_item)
  end

  def destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save!
    redirect_to cart_items_path
  end


  private
  def cart_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
