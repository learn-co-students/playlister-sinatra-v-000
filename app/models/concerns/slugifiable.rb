class Slugifiable
  def slug(string)
    x = string.downcase.split(' ')
    x.join('-')
  end
end