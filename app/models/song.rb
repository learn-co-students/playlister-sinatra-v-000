class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genre_songs
  has_many :genres, through: :genre_songs

  include Slugifiable


  def self.find_by_slug(slug)
    stop_words = %w{a an and the or for of nor with}
    name = slug.split("-").each_with_index.map { |word, index| stop_words.include?(word) && index > 0 ? word : word.capitalize }.join(" ")
    self.find_by_name(name)
  end

end
