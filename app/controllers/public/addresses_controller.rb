class Public::AddressesController < ApplicationController


  def new
    @adress = Adress.new
  end

  def create
    @adress = Adress.new(adress_params)

    if @adress.save
      # redirect_to adresses_url(id: current_user.id)
      redirect_to adresses_path
    else
      render 'new'
    end
  end
  
  def edit
    @adress = Adress.new
  end
  
  

  private
  def adress_params
    # params.require(:adress).permit(:user_id, :postal_code, :city, :street, :others, :c_adress_flg, :s_adress_flg)
    params.require(:adress).permit(:user_id, :postal_code, :name)
  end



end
