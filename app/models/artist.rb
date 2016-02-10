class Artist < ActiveRecord::Base

	has_many :songs
	has_many :genres, through: :songs

	def slug
		self.name.split(/[^\w]/).map{|l| l.downcase}.join("-")
	end

	def self.find_by_slug(slug)
		self.all.find {|a| a.slug ==slug}
	end




end
