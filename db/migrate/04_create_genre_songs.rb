class CreateGenreSongs < ActiveRecord::Migration

  def change
    create_table :genre_songs do |t|
      t.integer :genre_id
      t.integer :song_id
    end
  end

end