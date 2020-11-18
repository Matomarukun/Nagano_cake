class Public::AddressesController < ApplicationController


  def new
    @adress = Adress.new
  end

  def create
    @adress = Adress.new(adress_params)

    if @adress.save
      # redirect_to adresses_url(id: current_user.id)
      redirect_to public_adresses_path
    else
      render 'new'
    end
  end

  def edit
    @addresse = find_address_by_id
  end

  def update
    @addresse = find_address_by_id
    @addresse.update(addresse_params)
    redirect_to public_address_path
  end

  # def edit
  #   @post = Post.find_by(id: params[:id])
  # end
  # def update
  #   @post = Post.find_by(id: params[:id])
  #   @post.update(title: params[:title])
  #   redirect_to("/")
  # end


  private
  def adress_params
    # params.require(:adress).permit(:user_id, :postal_code, :city, :street, :others, :c_adress_flg, :s_adress_flg)
    params.require(:adress).permit(:user_id, :postal_code, :name)
  end



end
