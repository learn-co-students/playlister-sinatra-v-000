class Artist < ActiveRecord::Base
  extend Concerns::Slugifiable

  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

end
