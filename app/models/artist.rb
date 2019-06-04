class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

#  extend Slugifiable::ClassMethods
#  include Slugifiable::InstanceMethods

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    instance = nil
    self.all.each do |i|
      if i.slug == slug
        instance = i
      end
    end
    instance
  end
end
