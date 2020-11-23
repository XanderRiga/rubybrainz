# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubybrainz/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 2.6.0'
  spec.name          = 'rubybrainz'
  spec.version       = Rubybrainz::VERSION
  spec.authors       = ['Xander Riga']
  spec.email         = ['xanderriga@live.com']

  spec.summary       = 'Wrapper for the MusicBrainz API'
  spec.description   = 'Wrapper for the MusicBrainz API'
  spec.homepage      = 'https://github.com/XanderRiga/rubybrainz'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/XanderRiga/rubybrainz'
  spec.metadata['changelog_uri'] = 'https://github.com/XanderRiga/rubybrainz'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
