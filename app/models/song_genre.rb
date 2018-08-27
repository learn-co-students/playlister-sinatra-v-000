class SongGenre < ActiveRecord::Base
	belongs_to :song
	belongs_to :genre

	validates :song_id, :genre_id, presence: true
end
