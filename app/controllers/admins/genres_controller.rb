class Admins::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_back(fallback_location: root_path)
  end

  def update
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
