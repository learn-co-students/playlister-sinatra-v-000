class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.gsub(' ','-') if self.name != nil
  end

  def self.find_by_slug(slug)
    array = slug.split("-")
    unslug = array.collect do |a|
      if a == array.first
        a.capitalize
      elsif a == array.last
        a.capitalize
      else
        a
      end
    end
    unslug = unslug.join(" ")
    self.find_by(name: unslug)
  end
end
