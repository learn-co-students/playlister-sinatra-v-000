class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  def slug
    name.downcase.gsub ' ', '-'
  end

  def self.find_by_slug str
    Genre.find_by name: capitalize_slug(str)
  end

  def self.capitalize_slug str
    # this can be refactored with reduce
    str.split('-').reduce(Array.new) do |memo, word|
      if word == 'with' || word == 'a' || word == 'the'
        memo << word
      else
        memo << word.capitalize
      end
    end.join ' '
    # new_string = []
    #
    # str.split('-').each do |word|
    #   new_string << word.capitalize
    # end
    #
    # new_string.join ' '
  end
end
