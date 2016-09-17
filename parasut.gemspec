# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parasut/version'

Gem::Specification.new do |spec|
  spec.name                  = 'parasut'
  spec.version               = Parasut::VERSION
  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.0.0'
  spec.authors               = ['Dunya Kirkali', 'Onur Kucukkecce']
  spec.email                 = ['dunyakirkali@ahtung.co', 'onurkucukkece@ahtung.co']

  spec.summary               = %q{Parasut client.}
  spec.description           = %q{Parasut client.}
  spec.homepage              = 'https://github.com/ahtung/parasut-ruby'
  spec.license               = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'TODO: Set to "http://mygemserver.com"'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'
  spec.add_dependency 'oauth2'
  spec.add_dependency 'rest-client'
  spec.add_dependency 'her'
  spec.add_dependency 'kaminari'
  spec.add_development_dependency 'bundler', '~> 1.13.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.42.0'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'webmock'
end
