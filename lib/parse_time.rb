module ParseTime

module Slugger
    def slug
      self.name.gsub(" ", "-").downcase
    end
end

module FindSlug
  def find_by_slug(slug)
    self.all.find {|x| x.slug == slug }
  end
end


end
