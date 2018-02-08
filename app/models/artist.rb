class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    stripped = self.name.gsub(/[^0-9A-Za-z. ]/, '').downcase
    stripped.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    formatted_name = []
    preposition = ["with", "a", "the", "of", "in", "to", "for", "on", "at", "from", "by", "about", "as", "into", "like", "through", "after", "over", "between", "out", "against", "during", "without", "before", "under", "around", "amoung"]
    artist_name = slug.gsub("-"," ").split
    artist_name.each_with_index do |word, index|
      if index == 0 || preposition.include?(word) == false
        word.capitalize!
      end
      formatted_name << word
    end
    reslugged = formatted_name.join(' ')
    @artist = Artist.find_by(name: reslugged)
  end
end
