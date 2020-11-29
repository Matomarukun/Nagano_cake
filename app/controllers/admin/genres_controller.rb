class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    # @genre.admin_id = current_admin.id

    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render 'index'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path(@genre), notice: "You have updated address successfully."
    else
      render "edit"
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:is_active, :genre_id, :name )
  end


end
