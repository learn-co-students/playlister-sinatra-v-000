module Concerns
  module Slugifiable
    def slug
      self.name.split(' ').join('-').downcase
    end
  end
end
