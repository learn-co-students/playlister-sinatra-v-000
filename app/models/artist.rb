class Artist < ActiveRecord::Base
has_many :songs
has_many :genres, through: :songs



def slug
  self.name.gsub(" ", "-").downcase

end

def self.find_by_slug(sluggedstring)
  #binding.pry
  @array1 = []
    self.all.find do |inst|
      inst.slug == sluggedstring
      end

end


end
