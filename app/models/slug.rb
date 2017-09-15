module Slug
  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      deslugged_name = slug.split("-").collect do |word|
        word.capitalize
      end.join(" ")
      find_by(name: deslugged_name)
    end
  end
end
