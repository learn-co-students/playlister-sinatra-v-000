class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug( slug)
    self.all.find{|data| data.slug == slug}
    #name.split.join(' ').gsub('-',' ').split.map(&:capitalize).join(' ')
  end

end
