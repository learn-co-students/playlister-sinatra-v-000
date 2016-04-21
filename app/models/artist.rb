class Artist < ActiveRecord::Base
	include Slugifiable::InstanceMethods
	has_many :songs
	has_many :genres, through: :songs

	def self.find_by_slug(slug)
			self.all.detect{|name| name.slug == slug}
	end
end 