module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      deslug = slug.gsub("-", " ")
      name = deslug.split(" ").map { |word| word.capitalize }.join(" ")
      self.find_by(name: name)
    end
  end
end
