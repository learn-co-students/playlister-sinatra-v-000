#03_add_artists_to_songs.rb
class AddArtistsToSongs < ActiveRecord::Migration
	def change
		add_column :songs, :artist_id, :integer
	end
end
