class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end



# ARTIST 
# has_many :songs
# has_many :genres, through: :songs
# ID |  name

# SONG
# belongs_to :artist
# has_many :genres, through: :song_genres
# ID  |  name  | artist_id

# GENRE 
# has_many :songs, through: :song_genres
# has_many :artists, through: :songs
# ID  |  name


# SONG_GENRES 
# song_id  |  genre_id