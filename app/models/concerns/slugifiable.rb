module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
      end
    end

  module ClassMethods
    def find_by_slug(sluggified)
      all.find {|instance| instance.slug == sluggified}
    end
  end

end
