# -*- encoding: utf-8 -*-
# stub: neo4j-community 2.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "neo4j-community"
  s.version = "2.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dmytrii Nagirniak", "Andreas Ronge"]
  s.date = "2014-11-11"
  s.description = "The Java Jar files for the Neo4j Community, a high performance, fully ACID transactional graph database \u{2013} licensed under the GPL, see license - http://neo4j.org/licensing-guide/ "
  s.email = ["dnagir@gmail.com", "andreas.ronge@gmail.com"]
  s.homepage = "https://github.com/dnagir/neo4j-community"
  s.rubyforge_project = "neo4j-community"
  s.rubygems_version = "2.4.3"
  s.summary = "The neo4j Community edition v2.1.5 JAR files"

  s.installed_by_version = "2.4.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end
