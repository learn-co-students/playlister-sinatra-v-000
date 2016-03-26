class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.gsub ' ', '-'
  end

  def self.find_by_slug str
    Artist.find_by name: capitalize_slug(str)
  end

  def self.capitalize_slug str
    new_string = []

    str.split('-').each do |word|
      if word == 'with' || word == 'a' || word == 'the'
        new_string << word
      else
        new_string << word.capitalize
      end
    end

    new_string.join ' '
  end
end
