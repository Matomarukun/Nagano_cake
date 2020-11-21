class Public::CustomersController < ApplicationController
  def my_page
     @customer = Customer.find(params[:id])
  end

  def edit
       @customer = Customer.find(params[:id])
    if @customer == current_customer
      render "edit"
    else
      redirect_to  customers_my_page_path(current_customer)
    end
  end

  def update
  end


end
