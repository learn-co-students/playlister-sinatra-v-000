class Artist < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::KlassMethods
  has_many :songs
  has_many :genres, through: :songs

  def self.find_or_create_artist(params)
    # binding.pry
    if params["new_artist"].empty?
      true
    else
      if Artist.find_by(params["new_artist"])
        artist = Artist.find_by(params["new_artist"])
      else
        artist = Artist.create(params["new_artist"])
      end
    end
    artist
  end
end
