class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.admin_id = current_admin.id

    if @genre.save
      redirect_to new_admins_genre_path
    else
      @genre = Genre.all
      render 'new'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    if @genre.update(genre_params)
      redirect_to new_admins_genre_path(@genre), notice: "You have updated address successfully."
    else
      render "edit"
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:is_active, :genre_id, :name )
  end


end
