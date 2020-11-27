class Admin::OrderDetailsController < ApplicationController
  def update
    order_item = OrderItem.find(params[:id])
    order_item.update
  end


   private
  def order_item_params
    params.require(:order_items).permit(:production_status)
  end

end
