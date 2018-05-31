module Slug 
  
  module Klass
    def find_by_slug(slug)
      all.detect{|o| o.slug == slug}
    end 
  
  end 
  
  module Instance
    def slug 
      name_arr = self.name.split(" ")
      name_arr.collect{|w| w.downcase}.join('-')
    end
  end 
  
end 