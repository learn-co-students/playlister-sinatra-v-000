require 'pry'

# slug module

module Slugifiable
  def slug
    self.name.gsub(" ","-").downcase
  end
end

module Slugifiable
  def find_by_slug(name)
    # binding.pry
    new_array = name.gsub("-"," ").split
    new_array = new_array.collect do |word|
      if word != "with" || word != "the"
        word.capitalize
      else
        word
      end
    end
    name = new_array.join(" ")
    name
  end
end
