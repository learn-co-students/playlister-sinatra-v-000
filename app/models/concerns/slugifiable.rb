module Slugifiable
  module InstanceMethods
  # --add a hyphen between the your name
    def slug
      unless self.name.nil?
        self.name.gsub(" ", "-").downcase
      end
    end
  end

  module ClassMethods
    # --find by original name before the name became a slug
    def find_by_slug(slug)
      self.all.find{ |instance| instance.slug == slug }

    end
  end

end
