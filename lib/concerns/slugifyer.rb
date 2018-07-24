module Slugifyer
  
  module ClassMethods
    def find_by_slug(name)
      self.class.all.find { |instance| instance.slug == slug }
    end
  end
  
  module InstanceMethods
    def slug
      name.downcase.strip.gsub(/\p{P}/, '').gsub(/\W+/, '-')
    end
  end

end
