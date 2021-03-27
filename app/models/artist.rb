class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.gsub(/[" "]/,"-")
  end

  def self.find_by_slug(slug)
    # Reviewed solution - why does this work? Because, when you call #slug on an instance of artist,
    # the method is using self.name and slugifying it which gives you the value to compare to, so
    # you don't have to save the converted value, you do it on the fly
    Artist.all.find {|artist| artist.slug == slug}
  end

end
