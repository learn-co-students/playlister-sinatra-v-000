module Slugs
  module InstanceSlug
    def slug
      self.name.downcase.gsub(' ', '-')
    end
  end

  module ClassSlug
    def find_by_slug(text)
      self.find{|selfclass| selfclass.slug == text}
    end
  end
end
