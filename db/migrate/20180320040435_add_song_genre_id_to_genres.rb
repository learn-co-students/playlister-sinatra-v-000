      class AddSongGenreIdToGenres < ActiveRecord::Migration[5.1]
        def change
          add_column :genres, :song_genre_id, :integer
        end
      end
