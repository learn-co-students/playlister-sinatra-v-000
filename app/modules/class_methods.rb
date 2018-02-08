module ClassMethods

  def self.find_by_slug(slug)
    name = slug.split("-").collect do |word|
      word.capitalize
    end.join(" ")
    self.find_by_name(name)
  end

end
