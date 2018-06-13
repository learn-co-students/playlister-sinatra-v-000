require_relative "concerns/slugifiable.rb"

class Artist < ActiveRecord::Base
	has_many :songs
	has_many :genres, through: :songs

	include Slugifiable::Instance 
	extend Slugifiable::Klass


end
