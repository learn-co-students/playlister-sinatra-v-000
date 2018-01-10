class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :genres, through: :songs

    def slug
      name.downcase.gsub(" ","-")
end
    def self.find_by_slug_method(slug)
      Song.all.find{|song| song.slug == slug}
    end
  end
