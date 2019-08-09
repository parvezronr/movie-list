class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy, :soft_delete, :restore]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.where(deleted: false) #!!!! Todo: pull the soft delte logic into a common module or concern.    
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      movie = render_to_string(partial: 'movies/movie', locals: {movie: @movie})
      render json: {movie: movie, message: 'Success'}, status: :ok
    else
      render json: {message: 'Error'}, status: :bad_request
    end    
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def soft_delete
    @movie.update_attribute(:deleted, true)       
      
    render json: {message: 'Success'}, status: :ok
  end

  def restore
    @movie.update_attribute(:deleted, false)       
      
    render json: {message: 'Success'}, status: :ok
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy

    render json: {message: 'Success'}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:name, :year, :genre_id)
    end
end
