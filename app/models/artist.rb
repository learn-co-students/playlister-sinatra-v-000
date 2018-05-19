# require_relative 'concerns/slugifiable.rb'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    self.all.each do |artist|
      if artist.slug == slug
        return artist
      end
    end
  end

end

# rspec spec/features/04_basic_view_spec.rb
# rspec spec/features/05_song_form_spec.rb

# rspec spec/models/01_artist_spec.rb

# https://stackoverflow.com/questions/4308377/ruby-post-title-to-slug
