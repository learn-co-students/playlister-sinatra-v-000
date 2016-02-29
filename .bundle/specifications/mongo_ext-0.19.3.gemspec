# -*- encoding: utf-8 -*-
# stub: mongo_ext 0.19.3 ruby ext
# stub: ext/cbson/extconf.rb

Gem::Specification.new do |s|
  s.name = "mongo_ext"
  s.version = "0.19.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["ext"]
  s.authors = ["Mike Dirolf"]
  s.date = "2010-04-05"
  s.description = "C extensions to accelerate the MongoDB Ruby driver. For more information about Mongo, see http://www.mongodb.org."
  s.email = "mongodb-dev@googlegroups.com"
  s.extensions = ["ext/cbson/extconf.rb"]
  s.files = ["ext/cbson/extconf.rb"]
  s.homepage = "http://www.mongodb.org"
  s.rubygems_version = "2.4.3"
  s.summary = "C extensions for the MongoDB Ruby driver"

  s.installed_by_version = "2.4.3" if s.respond_to? :installed_by_version
end
