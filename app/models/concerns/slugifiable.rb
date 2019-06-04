module Slugifiable 
  module InstanceMethods
    def slug  
      @slug = self.name.split(' ').join('-')
      
    end 
  end
  
  module ClassMethods
    def find_by_slug(slug)
      result = self.all.find {|t| t.slug == slug}
      #a = slug.split('-')
      #b = a.collect {|new| new.capitalize}
      #name = b.join(' ')
      
      search_result = self.find_by("name" => result.name)
    end 
  end
end 