class PosterImagesController < ApplicationController

  before_filter :restrict_access
  before_filter :load_movie

  def new
    @poster_image = @movie.poster_images.build
  end

  def create
    @poster_image = @movie.poster_images.build
    @poster_image.user_id = current_user.id

    if @poster_image.save
      redirect_to @movie, notice: "Review created successfully"
    else
      render :new
    end
  end

  protected

  def load_movie
    @movie = Movie.find(params[:movie_id])
  end

  def poster_image_params
    # params.require(:poster_image).permit(:text, :rating_out_of_ten)
  end


end
