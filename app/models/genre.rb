class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs



    def slug
      name.split(" ").join("-").downcase
    end

    def self.find_by_slug(arg)
      self.all.find do |a|
        a.slug == arg
        end
      end

end
