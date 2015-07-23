Gem::Specification.new do |s|
  s.name        = 'fson'
  s.version     = '0.0.0'

  s.summary     = 'Fluent builder for API JSON responses'
  s.description = 'Building simple JSON responses with fluent builder'

  s.authors     = ['Mateusz Kluczny']
  s.email       = 'mkluczny@gmail.com'

  s.homepage    = 'https://github.com/mkluczny/fson'
  s.license     = 'MIT'

  s.files         = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.require_path  = 'lib'

  s.add_development_dependency 'rspec', '~> 3.2'
  s.add_development_dependency 'rake',  '~> 10.4'
end