module Slugifiable
  module ClassMethods
    def find_by_slug(text)
      self.all.find {|instance| instance.slug == text}
      #Artist.find_by_name(text.split("-").collect {|text| text.capitalize}.join(" "))
    end
  end

  module InstanceMethods
    def slug
      self.name.split(" ").join("-").downcase
    end
  end

end