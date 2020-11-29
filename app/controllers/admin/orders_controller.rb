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
    params.require(:order).permit(:customer_id, :status, :order_sum, :shipping, :method_pay, :name, :postal_code, :address, :created_at, :updated_at)
  end

end

