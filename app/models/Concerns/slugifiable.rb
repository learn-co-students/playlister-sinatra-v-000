module Concerns::Slugifiable
  module ClassMethods
    LC = ['a', 'an', 'by', 'is', 'for', 'the', 'with']
    def find_by_slug(slug)
      name = slug.split('-').map do |w|
        if LC.include?(w)
          w
        else
          w.capitalize!
        end
      end.join(' ')
      self.find_by(name: name)
    end
  end

  module InstanceMethods

    def slug
      self.name.gsub(' ','-').downcase.strip
    end
  end

end
