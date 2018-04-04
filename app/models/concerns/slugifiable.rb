module Slugifiable

  module InstanceMethods
    def slug
      self.name.downcase.split(" ").join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)

      song_name = slug.gsub(/-/, " ").split(" ").map do |word|
        word.capitalize
      end.join(" ")
      binding.pry
      #song = self.find_by(name: "#{name}")
      #song = self.find_by(name: object_name)

      #song = self.find_by(name: "That One with the Guitar")
      song = self.all.find do |song|
        song.name == song_name
      end

    end
  end


end
