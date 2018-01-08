module Slug
  module InstanceMethods
    def slug
      array = self.name.split(" ")
      array = array.join("-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      slug = slug.split("-")
      slug.collect! do |word|
        if word != 'with' && word != 'the'
          word.capitalize
        else
          word
        end
      end
      slug = slug.join(" ")
      self.all.find_by(name: slug)
    end
  end
end
