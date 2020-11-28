class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end


  private
  def order_params
    params.require(:order).permit(:item_id, :order_id, :price, :amount, :production_status)
  end

# def order_params
#     params.require(:order).permit(:item_id, :order_id, :status, :order_sum, :shipping, :method_pay, :name, :postal_code, :address)
#   end

#   def order_item_params
#     params.require(:order_item).permit(:order_id, :item_id, :production_status, :amount, :price)
#   end


end

