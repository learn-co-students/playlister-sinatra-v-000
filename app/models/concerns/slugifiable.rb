module Slugifiable

  module KlassMethods
    def find_by_slug(slug)
      # binding.pry
      split_slug = slug.split("-")
      split_slug.each_with_index do |word, i|
        if i == 0
          word.capitalize!
        elsif !(word == "with" || word == "the" || word == "a")
          word.capitalize!
        end
      end
      name = split_slug.join(" ")
      if self == Genre
        name.downcase
      end
      self.find_by(name: name)
    end
  end


  module InstanceMethods
    def slug
      # binding.pry
      slug = self.name.strip
      split_slug = slug.split(/\W/)
      # binding.pry
      split_slug.delete_if{|word| word == ""}
      slug = split_slug.join("-")
      slug.downcase
    end
  end

end
