module Slugification

  module ForClass
    def find_by_slug(slug)
      self.all.detect{|one| one.slug == slug}
    end
  end

  module ForInstance
    def slug
      self.name.downcase.gsub(/[[$&\.\,\'\"\[\]\{\}\(\)\+\\\/\|]]/, "").gsub(/[\s]+/, "-")
    end
  end

end
