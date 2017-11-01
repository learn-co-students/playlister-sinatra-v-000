module Slug

  module InstanceMethods
    def slug
      self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end

  module ClassMethods


    def find_by_slug(slug)
      name = slug.split('-').collect {|word| word.capitalize}.join(" ")
      # self.find_by(name: name)
      self.where('lower(name) = ?', name.downcase).first 
    end
  end

end
