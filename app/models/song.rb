class Song < ActiveRecord::Base
  include Slugable::InstanceMethods
   belongs_to :artist
  has_many  :song_genres
  has_many  :genres, through: :song_genres

  def self.find_by_slug(slug)
       self.all.find do |instance|
        instance.slug == slug
   end
 end

end
