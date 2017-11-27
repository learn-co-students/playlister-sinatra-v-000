
module Slugifiable

  module Slug
    def slug
      self.name.gsub(/\W/,"-").downcase
    end
  end

end
