class Public::AddressesController < ApplicationController


  def index
    @address = Address.new
    @addresses = Address.all
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

  def edit
    @address = Address.find(params[:id])
  end


  def update
    if @address.update(address_params)
      redirect_to addresses_path(@address), notice: "You have updated address successfully."
    else
      render "edit"
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end



  private
  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :name, :address)
  end
end