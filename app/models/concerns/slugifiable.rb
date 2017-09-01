module Concerns
  module Slugify
    def slug
      name.downcase.gsub(' ', '-')
    end

    def find_by_slug(slug)
      self.all.detect{|a| a.name.downcase.gsub(' ', '-') == slug}
    end

  end
end
