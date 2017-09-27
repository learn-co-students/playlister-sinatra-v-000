require 'pry'
class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist, :class_name => 'Artist', :foreign_key => 'artist_id'

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    self.all.each do |instance|
      if instance.slug == slug
        return instance
      end
    end
  end

end
