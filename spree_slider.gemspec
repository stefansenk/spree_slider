Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_slider'
  s.version     = '4.0.1'
  s.summary     = 'Spree Slider extension'
  s.description = 'Adds a slider to the homepage'
  s.required_ruby_version = '>= 2.5.0'

  s.author            = 'Giuseppe Privitera'
  s.email             = 'priviterag@gmail.com'
  s.homepage          = 'https://github.com/spree-contrib/spree_slider'

  # s.files       = `git ls-files`.split("\n").reject { |f| f.match(/^spec/) && !f.match(/^spec\/fixtures/) }
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '>= 3.7.0', '< 5.0'
  s.add_dependency 'active_storage_validations', '~> 0.9.0'
  s.add_dependency 'spree_backend', spree_version
  s.add_dependency 'spree_core', spree_version
  s.add_dependency 'spree_extension'

  s.add_development_dependency 'spree_dev_tools'
  s.add_development_dependency 'sqlite3'
end
