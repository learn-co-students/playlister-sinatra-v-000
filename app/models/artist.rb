class Artist < ActiveRecord::Base
has_many :songs
has_many :genres, through: :songs



def slug
  self.name.gsub(" ", "-").downcase

end

def self.find_by_slug(sluggedstring)
  #binding.pry
  @array1 = []
    self.all.each do |inst|
      if inst.slug == sluggedstring
      @array1 << inst
      end
    end
    if !@array1.empty?
    @array1[0]
    end
end


end
