module FindOrCreate
  def find_or_create_by(attribs)
    found_item = self.find_by(attribs)
    if !!found_item
      found_item
    else
      self.create(attribs)
    end
  end
end
