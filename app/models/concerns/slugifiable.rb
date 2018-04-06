module Slugifiable
 
 module InstanceMethods
  def slug
   self.name.gsub(" ", "-").downcase
  end
 end

 module ClassMethods
  def find_by_slug(slugified_name)
   self.all.find do |x|
   x.slug == slugified_name
   end
  end
 end
end