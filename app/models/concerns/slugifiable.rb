def slug(name)
  name.delete"!@#$%^&*".gsub(/[" "]/, '-')
end

def find_by_slug
end
