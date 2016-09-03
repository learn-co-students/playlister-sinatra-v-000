module Slugifiable
  module InstanceMethods
  # --add a hyphen between the your name
    def slug
      self.name.downcase.gsub(" ","-")
    end
  end

  module ClassMethods
    # --find by original name before the name became a slug
    def find_by_slug(slug)
     name = slug.split("-").map { |word| word.capitalize }.join(" ")
     self.find_by_name(name)
    end
  end

end
