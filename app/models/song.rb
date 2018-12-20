class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  # include Slugifiable::InstanceMethods
  # extend Slugifiable::ClassMethods

  def slug
    self.name.split(/\W/).map {|word| word.downcase unless word.empty?}.compact.join('-')
  end

  def self.find_by_slug(slug)
    unslugged = nil
    unslug_arr = slug.split('-')
    self.all.map do |obj|
      if obj.name.downcase.include?(unslug_arr[0]) && obj.name.downcase.include?(unslug_arr[-1])
        unslugged = obj
      end
    end
    self.find_by_name(unslugged.name)
  end

end
