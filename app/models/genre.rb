class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    @found = []
    self.all.each do |a|
      if a.slug == slug
        @found << a
      end
    end
    @found[0]
  end

end
