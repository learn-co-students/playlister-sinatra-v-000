class Artist < ActiveRecord::Base

has_many :songs
has_many :genres, through: :songs

  def slug
    self.name.split(" ").join("-").downcase
  end

  def self.find_by_slug(word)
    Artist.all.find{|song| song.slug == word}
  end

end