class Artist < ActiveRecord::Base
	# require_relative './concerns/slugifiable.rb'
	extend Slugifiable::ClassMethods
	include Slugifiable::InstanceMethods

	has_many :songs
	has_many :genres, through: :songs

	# def slug
	# 	self.name.downcase.gsub(' ', '-')
	# end

	# def self.find_by_slug(slug)
	# 	self.all.select{|x| x.slug == slug}.first
	# end
end