class CreateSonggenres < ActiveRecord::Migration #join table here
  def change
    create_table :song_genres do |t|
      #t.string :songs not needed
      #t.string :genres not needed
      t.string :song_id #join tables work based on id
      t.string :genre_id
    end
  end
end
