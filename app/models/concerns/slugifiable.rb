module Slug 
  
  class Slugging
    def slug 
      self.name.gsub(" ", "-").downcase
    end 
    
    def self.find_by_slug(slug) 
      self.all.find{
        |item| item.slug == slug}
    end 
  end 
  
end 


