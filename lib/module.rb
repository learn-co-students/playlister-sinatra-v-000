module Slug 
   module InstanceMethods

     def slug
       name.downcase.gsub(/ /, "-")
     end 

   end 


  module ClassMethods

   def find_by_slug(slug) #Taylor Swift
     new_name = slug.split("-").collect { |name| name.capitalize }.join(" ")
     self.find_by name: new_name
   end
  end 

end