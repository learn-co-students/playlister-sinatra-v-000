module Slugify
  
  module InstanceMethods
    
  def slug 
    name = self.name
    splt_name = name.split(" ").
    splt_name.join("-").downcase
  end 
  
  
  module ClassMethods
    
  def find_by_slug(name) 
    splt_name = name.split("-")
    splt_name.join(" ").downcase
  end
  
  
end