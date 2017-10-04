module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.gsub(' ', '-')
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      name_array = slug.split("-")
      self.all.find do |item|
        clean_name = item.name.downcase.gsub('-', " ")
        clean_name.split(" ") == name_array
      end
    end
  end
end
