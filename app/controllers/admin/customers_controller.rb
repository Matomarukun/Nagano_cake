class Admin::CustomersController < ApplicationController

  def index
    @customer = Customer.new
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
    @customers = Customer.all
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice: "successfully."
    else
      render "show"
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :is_deleted )
  end

end
