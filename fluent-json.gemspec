Gem::Specification.new do |s|
  s.name        = 'fluent-json'
  s.version     = FluentJSON::VERSION

  s.summary     = 'Fluent builder for API JSON responses'
  s.description = 'Building simple JSON responses with fluent builder'

  s.authors     = ['Mateusz Kluczny']
  s.email       = 'mkluczny@gmail.com'

  s.homepage    = 'https://github.com/mkluczny/fluent-json-response'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.test_files    = gem.files.grep %r{^spec/}
  s.require_paths = %w(lib)

  s.add_development_dependency 'rspec', '~> 3.2.0'
  s.add_development_dependency 'rake'
end