class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    split_name = slug.split('-')
    name = ""
    split_name.collect! do |part|
      part.capitalize
      name += part.capitalize + " "
    end
    self.find_by(name: name.strip!)
  end

end

# rspec spec/models/03_genre_spec.rb
