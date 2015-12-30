module SlugFind
  def find_by_slug(slug)
    words = slug.split('-')
    name = words.map{|word| word.capitalize}.join(" ")
    self.all.find{|item| item.name == name}
  end
end