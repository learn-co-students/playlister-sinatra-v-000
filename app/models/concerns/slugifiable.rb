module Concerns
  module Slugifiable
    
    def find_by_slug(slug)
      self.all.each do |s|
        @objekt = s if s.slug == slug
      end
      @objekt
    end
    
    def slug
      self.name.downcase.gsub(' ', '-')
    end
    
  end
end