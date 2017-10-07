module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end

  module ClassMethods
    def find_by_slug(slug) #slug => "taylor-swift"

      #much cleaner and bug free refactored version
      self.all.find { |instance| instance.slug == slug }

      ## good first try version.
        # unslugged = slug.split("-").map {|word| word.capitalize}.join(" ") #=> "Taylor Swift"
        # self.find_by(name: unslugged)
        # does not account for something like "sam-i-am" => "Sam, I am" 
    end
  end
end
