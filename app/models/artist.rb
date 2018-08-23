class Artist < ActiveRecord::Base
	require_relative './concerns/slugifiable.rb'
	
	extend Slugifiable::ClassMethods
	include Slugifiable::InstanceMethods

	has_many :songs
	has_many :genres, through: :songs
end
