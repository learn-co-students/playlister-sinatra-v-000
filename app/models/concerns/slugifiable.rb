module Slugifiable

  module InstanceMethods
    def slug
      self.name.downcase.split(" ").join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      unslug = slug.gsub(/-/, " ").split(" ").map do |word|
        word.capitalize
      end.join(" ")
      #song = self.find_by(name: "#{name}")
      #song = self.find_by(name: object_name)

      #song = self.find_by(name: "That One with the Guitar")
      song = self.all.find do |song|
        song.name == object_name
      end
        binding.pry
    end
  end


end
