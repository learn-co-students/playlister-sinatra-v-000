module Slugifiable
  def slugify(title)
    title.downcase.gsub(' ', '-')
end
