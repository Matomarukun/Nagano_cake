class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @address = Address.new
    @addresses = Address.all
  end

  def confirm
    params[:order][:method_pay] = params[:order][:method_pay].to_i
    @order = Order.new(order_params)

    if params[:order][:address_number] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name+current_customer.first_name

    elsif  params[:order][:address_number] ==  "1"
      @order.postal_code = Address.find(params[:order][:select_address]).postal_code
      @order.address = Address.find(params[:order][:select_address]).address
      @order.name = Address.find(params[:order][:select_address]).name

    elsif params[:order][:address_number] ==  "2"
      @address = Address.new()
      @address.address = params[:order][:address]
      @address.name = params[:order][:name]
      @address.postal_code = params[:order][:postal_code]
      @address.customer_id = current_customer.id
      if @address.save
      @order.postal_code = @address.postal_code
      @order.name = @address.name
      @order.address = @address.address
      else
       render 'new'
      end
    end

    @cart_items = CartItem.where(customer_id: current_customer.id)

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items.each do |cart_item|

      OrderItem.create(order_id: @order.id, item_id: cart_item.item_id, amount: cart_item.amount)

    end
  current_customer.cart_items.destroy_all
  redirect_to complete_orders_path

  end


  def index
    @orders = current_customer.order
  end

  def show
    @order = Order.find(params[:id])
  end
  private
    def order_params
      params.require(:order).permit(:order_sum, :method_pay, :name, :postal_code, :address)
    end

end
