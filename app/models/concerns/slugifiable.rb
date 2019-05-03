module Concerns
  module Slugifiable
    def find_by_slug(object)
      object.name.downcase.gsub(' ', '-')
    end
  end
end