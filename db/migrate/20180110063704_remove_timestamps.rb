class RemoveTimestamps < ActiveRecord::Migration
  def change
    remove_column :artists, :created_at, :datetime
    remove_column :artists, :updated_at, :datetime
    remove_column :genres, :created_at, :datetime
    remove_column :genres, :updated_at, :datetime
    remove_column :song_genres, :created_at, :datetime
    remove_column :song_genres, :updated_at, :datetime
    remove_column :songs, :created_at, :datetime
    remove_column :songs, :updated_at, :datetime
  end
end
