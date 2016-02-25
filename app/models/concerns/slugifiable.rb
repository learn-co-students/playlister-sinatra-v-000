module Slugifiable
  module Slugifiable::InstanceMethods
    def slug
      name.downcase.gsub(" ","-")
    end
  end 

  module Slugifiable::ClassMethods
    def find_by_slug(slug)
      self.all.find {|instance| instance.slug == slug }
    end 
  end 

end 