require_relative 'lib/calandroid-widget-extension/version'

Gem::Specification.new do |gem|
  gem.name          = 'calandroid-widget-extension'
  gem.version       = CalandroidWidgetExtension::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ['Jani Jegoroff']
  gem.email         = ['jani.jegoroff@gmail.com']
  gem.summary       = 'Calabash-android widget extension.'
  gem.description   = 'Calabash-android widget extension provides convenient metaclasses for Calabash usage.'
  gem.homepage      = 'http://github.com/JaniJegoroff/calandroid-widget-extension'
  gem.license       = 'MIT'

  gem.files         = Dir.glob('lib/**/*.rb')
  gem.require_paths = ['lib']

  gem.test_files    = Dir.glob('spec/**/*.rb')

  gem.add_runtime_dependency 'calabash-android', '~> 0.5'
  gem.add_runtime_dependency 'to_boolean', '~> 1.0'

  gem.add_development_dependency 'rake', '~> 10.4'
  gem.add_development_dependency 'minitest', '~> 5.7'
  gem.add_development_dependency 'minitest-reporters', '~> 1.0'
  gem.add_development_dependency 'rubocop', '~> 0.33'
  gem.add_development_dependency 'coveralls', '~> 0.8'
end
