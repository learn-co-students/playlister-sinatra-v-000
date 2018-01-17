class Artist < ActiveRecord::Base
  has_many :songs
  has_many :song_genres, :through => :songs
  has_many :genres, :through => :song_genres

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
