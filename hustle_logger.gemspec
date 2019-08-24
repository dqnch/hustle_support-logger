$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'hustle_logger/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'hustle_logger'
  s.version     = HustleLogger::VERSION
  s.authors     = ['kawamura.hryk']
  s.email       = ['kawamura.hryk@gmail.com']
  s.homepage    = 'https://github.com/dqnch/hustle_logger'
  s.summary     = 'Pretty logger extension for RoR'
  s.description = 'Pretty logger extension for RoR'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'awesome_print'
  s.add_dependency 'lograge'
  s.add_dependency 'ougai'
  s.add_dependency 'rails', '~> 6.0.0'

  s.add_development_dependency 'rspec-rails'
end
