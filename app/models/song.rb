class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name.downcase.gsub ' ', '-'
  end

  def self.find_by_slug str
    Song.find_by name: capitalize_slug(str)
  end

  def self.capitalize_slug str
    str.split('-').reduce(Array.new) do |memo, word|
      if word == 'with' || word == 'a' || word == 'the'
        memo << word
      else
        memo << word.capitalize
      end
    end.join ' '
  end
end
