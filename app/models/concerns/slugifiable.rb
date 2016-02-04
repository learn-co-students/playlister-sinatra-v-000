module Slugify

  module InstanceMethods
    
    def slug
      self.name.downcase.gsub(/\s/, "-")
    end

  end

  module ClassMethods

    def find_by_slug(slug)

      find_by(name: slug.split("-").map{|word| ["a", "with", "the", "of"].include?(word) ? word : word.capitalize}.join(' '))

    end

  end

end