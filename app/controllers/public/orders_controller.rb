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
  #分岐
    if params[:order][:address_number] == "1"
      @order.postal_code = current_member.postal_code
      @order.address = current_member.address
      @order.name = current_member.last_name+current_member.first_name

    elsif  params[:order][:address_number] ==  "2"
      @order.postal_code = Address.find(params[:order][:address]).postal_code
      @order.address = Address.find(params[:order][:address]).shipping_address
      @order.name = Address.find(params[:order][:address]).name

    elsif params[:order][:address_number] ==  "3"
      @address = Address.new()
      @address.shipping_address = params[:order][:shipping_address]
      @address.name = params[:order][:name]
      @address.postal_code = params[:order][:postal_code]
      @address.member_id = current_member.id
      if @address.save
      @order.postal_code = @address.postal_code
      @order.name = @address.name
      @order.address = @address.shipping_address
      else
       render 'new'
      end
    end

    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = 0
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
  current_customer.cart_items.each do |cart_item|
    @order_item = OrderItem.new
    @order_item.item_id = cart_item.item_id
    @order_item.amount = cart_item.amount
    @order_item.price = (cart_item.item.price*1.1).floor
    @order_item.order_id =  @order.id
    @order_item.save
  end
  current_customer.cart_items.destroy_all
  redirect_to complete_orders_path

  end


  def index
  end

  private
    def order_params
      params.require(:order).permit(:order_sum, :method_pay, :name, :postal_code, :address)
    end

end
