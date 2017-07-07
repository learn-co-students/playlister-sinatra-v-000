class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

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
