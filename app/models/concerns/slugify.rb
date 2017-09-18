class Slugify
  def self.toSlug(str)
    str.split.join('-')
  end

  def self.toString(str)
    str.split('-').join
  end
end
