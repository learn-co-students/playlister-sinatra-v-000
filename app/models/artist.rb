class Artist < ActiveRecord::Base
  has_many :genres, through: :songs
  has_many :songs

  def slug
    self.name.downcase.strip.gsub(' ','-')
  end

  def self.find_by_slug(name)
    reg_name = name.titleize
    Artist.find_by_name(reg_name)
    end

end
