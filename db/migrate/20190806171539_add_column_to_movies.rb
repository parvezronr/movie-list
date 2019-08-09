class AddColumnToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :deleted, :boolean, :default => false
  end
end
