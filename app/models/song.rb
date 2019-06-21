class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  
  def slug
    name = self.name.downcase
    split_name = name.split(" ")
    slug_name = split_name.join("-")
    slug_name
  end
  
  def self.find_by_slug(slug)
    stop_words = %w{a an and the or for of nor with}
    split_slug = slug.split("-")
    deslugified_name = split_slug.each_with_index.map{|word, index| stop_words.include?(word) && index > 0 ? word : word.capitalize}.join(" ")
    self.find_by(name: deslugified_name)
  end
end