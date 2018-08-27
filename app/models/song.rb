class Song < ActiveRecord::Base
	require_relative './concerns/slugifiable.rb'

	extend Slugifiable::ClassMethods
	include Slugifiable::InstanceMethods

	belongs_to :artist
	has_many :song_genres
	has_many :genres, through: :song_genres

	validates :name, presence: true

end
