class TrashController < ApplicationController
	def index
		@movies = Movie.where(deleted: true)
    @genres = Genre.where(deleted: true)
  end

  def restore
    binding.pry
    @genre.update_attribute(:deleted, false)       
    @movie.update_attribute(:deleted, false)       
    
    render json: {message: 'Success'}, status: :ok
  end
end 