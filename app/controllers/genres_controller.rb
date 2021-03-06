class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :edit, :update, :destroy, :soft_delete, :restore]

  # GET /genres
  # GET /genres.json
  def index
    @genres = Genre.where(deleted: false).all
  end

  # GET /genres/1
  # GET /genres/1.json
  def show
  end

  # GET /genres/new
  def new
    @genre = Genre.new
  end

  # GET /genres/1/edit
  def edit
  end

  # POST /genres
  # POST /genres.json
  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      genre = render_to_string(partial: 'genres/genre', locals: {genre: @genre})
      render json: {genre: genre, message: 'Success'}, status: :ok
    else
      render json: {message: 'Error'}, status: :bad_request
    end
  end

  # PATCH/PUT /genres/1
  # PATCH/PUT /genres/1.json
  def update
    respond_to do |format|
      if @genre.update(genre_params)
        format.html { redirect_to root_url, notice: 'Genre was successfully updated.' }
        format.json { render :show, status: :ok, location: @genre }
      else
        format.html { render :edit }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def soft_delete
    @genre.update_attribute(:deleted, true)

    render json: {message: 'Success'}, status: :ok
  end

  def restore
    @genre.update_attribute(:deleted, false)

    render json: {message: 'Success'}, status: :ok
  end

  # DELETE /genres/1
  # DELETE /genres/1.json
  def destroy
    @genre.destroy
    respond_to do |format|
      format.html { redirect_to genres_url, notice: 'Success..!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def genre_params
      params.require(:genre).permit(:name)
    end
end
