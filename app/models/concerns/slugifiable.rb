module Slugifiable
  def self.slug(name)
    name.downcase.gsub(' ', '-').gsub('$', 's').gsub('&','and').gsub('+', 'plus').gsub(/[\'\.\(\)\,]/, '')
  end
end