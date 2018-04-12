class Artist < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  
  has_many :songs
  has_many :genres, through: :songs

  #def slug
  #  self.name.downcase.strip.gsub(' ', '-')
  #end

  #def self.find_by_slug(slug)

  #  slug_arr = slug.gsub('-', ' ').split(' ')
  #  slug_arr.collect! do |w|
  #    w.capitalize
  #  end
  #  name = slug_arr.join(' ')
  #  Artist.find_by(name: name)
    #binding.pry
  #end
end
