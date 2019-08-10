class TrashController < ApplicationController
	def index
		@movies = Movie.where(deleted: true)
    @genres = Genre.where(deleted: true)
  end
end 