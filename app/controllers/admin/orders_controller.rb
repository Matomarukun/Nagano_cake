class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).per(10)
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

end

