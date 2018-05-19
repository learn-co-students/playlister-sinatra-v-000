class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

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

# rspec spec/models/02_song_spec.rb
