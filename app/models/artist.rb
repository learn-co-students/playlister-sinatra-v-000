class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    #slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    name.parameterize
  end

  def self.find_by_slug(slug)
    self.all.detect do |a|
      a.slug == slug
    end
  end

end

#The find_by_slug method should use the slug method to retrieve a song/artist/genre from the database and return that entry.
