class Artist < ActiveRecord::Base
  include Slugifiable
  has_many :genres, through: :songs
  has_many :songs


  def self.find_by_slug(slug)
   self.all.find { |s| s.slug == slug }
  end

end
