class Genre < ActiveRecord::Base
  has_many :artists
  has_many :songs

  def slug
    self.name.gsub(/[ .]/, "-")
  end
end
