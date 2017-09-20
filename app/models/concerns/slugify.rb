class Slugify
  def self.toSlug(str)
    str.split.join('-').downcase
  end

end
