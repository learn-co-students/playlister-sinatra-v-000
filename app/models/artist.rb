class Artist < ActiveRecord::Base
  has_many :songs
  has_many :song_genres, through: :songs
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
    artist = Artist.find_by(name: name.strip!)
    # puts "slug = '#{slug}'|| name = '#{name}' || Artist = #{artist} || Artist.name = '#{artist.name}'"
  end

end


# rspec spec/models/01_artist_spec.rb

# https://stackoverflow.com/questions/4308377/ruby-post-title-to-slug
