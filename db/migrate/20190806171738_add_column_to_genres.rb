class AddColumnToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :deleted, :boolean, :default => false
  end
end
