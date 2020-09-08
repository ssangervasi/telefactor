# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'telefactor/repo_management/version'

Gem::Specification.new do |spec|
  spec.name = 'telefactor-repo_management'
  spec.version = Telefactor::RepoManagement::VERSION
  spec.authors = ['Sebastian Sangervasi']
  spec.email = ['villain@harmless.dev']
  spec.license = 'MIT'

  spec.summary = spec.name
  spec.description = spec.name

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib/telefactor']

  ##
  # Runtime Deps
  spec.add_runtime_dependency 'awesome_print', '~> 1.8'
  spec.add_runtime_dependency 'faraday-http-cache', '~> 2.0'
  spec.add_runtime_dependency 'git', '~> 1.5'
  spec.add_runtime_dependency 'lightly', '~> 0.3'
  spec.add_runtime_dependency 'octokit', '~> 4.14'
  spec.add_runtime_dependency 'safe_yaml', '~> 1.0'
  spec.add_runtime_dependency 'tty-prompt', '~> 0.19.0'
  spec.add_runtime_dependency 'tty-table', '~> 0.11'

  # dry-rb suite
  spec.add_runtime_dependency 'dry-initializer', '~> 3.0'
  spec.add_runtime_dependency 'dry-struct', '~> 1.0'
  spec.add_runtime_dependency 'dry-types', '~> 1.2'

  ##
  # Dev deps
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'pry', '~> 0.12'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 0.74'
end
