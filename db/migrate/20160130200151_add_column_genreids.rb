class AddColumnGenreids < ActiveRecord::Migration
  def change
    add_column :songs, :genre_ids, :integer
    add_column :artists, :genre_ids, :integer
  end
end
