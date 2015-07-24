require File.expand_path('../lib/fson/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'fson'
  s.version     = Fson::VERSION

  s.summary     = 'Fluent builder for API JSON responses'
  s.description = 'Building simple JSON responses with fluent builder'

  s.authors     = ['Mateusz Kluczny']
  s.email       = 'mkluczny@gmail.com'

  s.homepage    = 'https://github.com/mkluczny/fson'
  s.license     = 'MIT'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables  = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_path = ['lib']

  s.add_development_dependency 'rspec', '~> 3.3'
  s.add_development_dependency 'rake',  '~> 10.4'
end