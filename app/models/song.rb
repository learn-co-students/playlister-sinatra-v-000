class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    stripped = self.name.gsub(/[^0-9A-Za-z. ]/, '').downcase
    stripped.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    formatted_name = []
    preposition = ["with", "a", "the", "of", "in", "to", "for", "on", "at", "from", "by", "about", "as", "into", "like", "through", "after", "over", "between", "out", "against", "during", "without", "before", "under", "around", "amoung"]

    song_name = slug.gsub("-"," ").split
    song_name.each_with_index do |word, index|
      if index == 0 || preposition.include?(word) == false
        word.capitalize!
      end
      formatted_name << word
    end
    reslugged = formatted_name.join(' ')
    @song = Song.find_by(name: reslugged)
  end

end
