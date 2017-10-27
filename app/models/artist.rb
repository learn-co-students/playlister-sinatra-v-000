require 'pry'
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(/\s/, '-')
  end

  def self.find_by_slug(slug)
    query = nil
    self.all.each do |a|
      if a.slug == slug
        query = a
      end
    end
    if !!query
      query
    else
      nil
    end
  end
end
