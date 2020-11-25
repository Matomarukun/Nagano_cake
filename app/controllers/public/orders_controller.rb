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


  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id

    if @address.save
      redirect_to addresses_path
    else
      @addresses = Address.all
      render 'index'
    end
  end

  private
    def order_params
      params.require(:order).permit(:customer_id, :status, :order_sum, :method_pay, :name, :postal_code, :address)
    end

end
