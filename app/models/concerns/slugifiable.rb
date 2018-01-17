module Slugifiable

   def self.slug(string)
     string.downcase.gsub(" ", "-")
   end

 
end