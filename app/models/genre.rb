class Genre < ActiveRecord::Base
  validates_presence_of :name

  has_many :songs_genres
  has_many :songs, through: :songs_genres
  has_many :artists, through: :songs


  def slug
    self.name.downcase.gsub(" ", "-")
  end

   def self.find_by_slug(slug)
     Genre.all.find do |genre|
       genre.slug == slug
     end
   end

end
