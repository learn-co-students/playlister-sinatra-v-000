# artist.rb object model
require_relative './concerns/slug'

class Artist < ActiveRecord::Base
	validates_uniqueness_of :name, :case_sensitive => false
	has_many :songs
	has_many :genres, through: :songs

	extend Slug::ClassMethods

	include Slug::InstanceMethods
end