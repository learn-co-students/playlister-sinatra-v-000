module Concerns
  module Slugifiable
    
    def find_by_slug(slug)
      self.all.each {|s| @objekt = s if s.slug == slug}
      @objekt
    end
    
    def slug
      self.name.downcase.gsub(' ', '-')
    end
    
  end
end