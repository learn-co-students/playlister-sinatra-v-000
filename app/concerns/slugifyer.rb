module Slugifyer

  module ClassMethods
    def find_by_slug(name_slug)
      all.detect do |instance|
        instance.slug == name_slug
      end
    end
  end

  module InstanceMethods
    def slug
      name.downcase.strip.gsub(/\p{P}/, '').gsub(/\W+/, '-')
    end
  end

end
