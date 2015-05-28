class MoviesController < ApplicationController

  def index
    @movies = Movie.all 
    @movies = @movies.where(title: params[:user_title]) if params[:user_title].present?
    @movies = @movies.where(director: params[:user_director]) if params[:user_director].present?

    if params[:runtime_number].present?

      case params[:runtime_number].to_i
      when 1
        @movies = @movies.where(runtime_in_minutes: 0..90) 
      when 2
        @movies = @movies.where(runtime_in_minutes: 90..120) 
      when 3
        @movies = @movies.where(runtime_in_minutes: 120..1000000) 
      end
    end


  end



def show
  @movie = Movie.find(params[:id])
end

def new
  @movie = Movie.new
end

def edit
  @movie = Movie.find(params[:id])
end

def create
  @movie = Movie.new(movie_params)

  if @movie.save

    redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
  else
    render :new
  end
end

def update
  @movie = Movie.find(params[:id])

  if @movie.update_attributes(movie_params)
    redirect_to movie_path(@movie)
  else
    render :edit
  end
end

def destroy
  @movie = Movie.find(params[:id])
  @movie.destroy
  redirect_to movies_path
end

protected

def movie_params
  params.require(:movie).permit(
    :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, :avatar)

end

end