module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    # def find_by_slug(slug)
    #   self.find_by_name(slug.gsub("-", " ").titleize)
    #   binding.pry
    # end
  end
end
