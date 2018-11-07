module Slugifiable

  module InstanceMethods
    def slug
      # slug = self.name.gsub("/[\p{P}\p{S}]/")

      slug = self.name.downcase.gsub(" ","-")
      # slug
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      # binding.pry
      name = slug.gsub("-"," ").split.map(&:capitalize).join(' ')
      thing = self.find_by(:name => "#{name}")
      thing
    end
  end
end
