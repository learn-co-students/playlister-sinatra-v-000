module Slugifiable
  module InstanceMethods
    def slug
      maxlength = 35
  	  title = name.gsub(' ', '-').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '-').downcase
  	   return title[0, title.length > maxlength ? (title[0, maxlength].rindex('-') or maxlength) : maxlength]
     end
   end

   module ClassMethods
     def find_by_slug(slug_string)
       all.find{|name| name.slug == slug_string}
     end
   end
end
