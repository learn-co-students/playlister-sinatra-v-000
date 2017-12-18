class Genre < ActiveRecord::Base
  include Slugifiable
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def self.find_by_slug(name)
    self.all.detect do |object|
      object.slug == name
    end
  end

end
