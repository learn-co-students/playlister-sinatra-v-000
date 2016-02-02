class Artist < ActiveRecord::Base
	has_many :songs
	has_many :genres, through: :songs
  include Concerns::Slugifiable

	# def slug
	# 	slug = self.name.split(" ").map { |word| word.strip.downcase } 
	# 	slug.join("-")
	# end

	# def self.find_by_slug(slug)
	# 	name = slug.split("-").map { |word| word.strip.capitalize }
	# 	self.find_by(name: name.join(" "))
	# end
end