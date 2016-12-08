module Displayable
  def display_name
    if self.name.length > 38
      self.name.scan(/.{36}/)[0] + "..."
    else
      self.name
    end
  end
end
