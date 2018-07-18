class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    @slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    self.name = @slug
  end

  def self.find_by_slug(slug)
    words_to_ignore = ["the", "of", "with", "a"]
    new_slug = slug.gsub("-", " ").split(/ |\_/).map do |word|
      unless words_to_ignore.include?(word)
        word.capitalize
      else
        word
    end
  end
    new_slug = new_slug.join(" ")
    Song.find_by(name: new_slug)
  end

end
