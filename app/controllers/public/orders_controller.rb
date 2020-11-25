class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @address = Address.new
    @addresses = Address.all
  end

  def confirm
    #@order = Order.find(params[:id])
    @cart_items = CartItem.all
  end

  def index
  end

  private
    def order_params
      params.require(:order).permit(:customer_id, :status, :order_sum, :method_pay, :name, :postal_code, :address)
    end

end
