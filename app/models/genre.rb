class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    @found = []
    self.all.each do |x|
      if x.slug == slug
        @found << x
      end
    end
    @found[0]
  end
end
