class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
    self.where('name LIKE ?', "#{slug.gsub('-', ' ').downcase}").take
  end
end
