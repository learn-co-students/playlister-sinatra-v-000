module Slugifiable
  module InstanceMethods
    def slug
      arr = self.name.split(" ")
      new_arr = arr.collect {|word| word.downcase}
      slug = new_arr.join("-")
    end
  end
  
  module ClassMethods
    def find_by_slug(slug)
      self.all.find {|instance| instance.slug == slug}
    end
  end
end
  
  