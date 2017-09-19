# require './concerns/slugifiable.rb'

class Song < ActiveRecord::Base

	belongs_to :artist
	has_many :song_genres
	has_many :genres, through: :song_genres

	@@creation_message = nil
	@@update_message = nil

	def self.creation_message
		@@creation_message
	end

	def self.update_message
		@@update_message
	end

	extend Slugifiable::ClassMethods

	include Slugifiable::InstanceMethods

	after_create :create_message

	def create_message
		@@creation_message = "Successfully created song."
	end

end