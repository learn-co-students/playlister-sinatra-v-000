module Slugifiable

  module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase
    end#slug
  end#InstanceMethods

  module ClassMethods
    def find_by_slug(slugified_name)
      self.all.find do |x|
        x.slug == slugified_name
      end#do
    end#find_by_slug
  end#ClassMethods
  
end#Slugifiable
