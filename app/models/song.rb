class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
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
