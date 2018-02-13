class Slugifiable

    def self.slugify(name)
      name.downcase.gsub(" ", "-")
    end

    def self.unslugify(slug)
      slug.gsub("-", " ").downcase
    end

end
