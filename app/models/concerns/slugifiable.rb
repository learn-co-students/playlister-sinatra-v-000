module Slugifiable
  module InstanceMethod
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(input)


      unsluged = input.gsub("-", " ").split.map { |e| e.capitalize }
      self.find_by(name: unsluged.join(" "))
    end
  end

end
