module Concerns
  module Slugifiable
    
    def find_by_slug(slug)
      object_name = slug.split('-').each {|w| w.capitalize!}.join(' ')
      self.find_by(:name => object_name)
    end
    
    def slug
      self.name.downcase.gsub(' ', '-')
    end
    
  end
end