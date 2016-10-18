class ActiveRecord::Base
    def slug
      self.name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
      name = slug.gsub("-", " ").titleize
      self.find_by(name: name)
    end
end
