class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    @name = self.name
    @name.downcase.strip.gsub(' ', '-')
    # @name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
  
  def self.find_by_slug(slug)
    @name = slug.split("-").map!{|word| word.capitalize}.join(" ")
    # @name = slug.gsub(' ', '-').upcase
    self.find_by_name(@name)
  end
end