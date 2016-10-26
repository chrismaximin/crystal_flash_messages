$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'crystal_flash_messages/version'

Gem::Specification.new do |s|
  s.name = 'crystal_flash_messages'
  s.version = CrystalFlashMessages::VERSION::STRING
  s.summary =
    'A simple Rails view helper which displays one or' \
    ' more HTML `div`s with the `flash` messages.'
  s.authors = ['Christophe Maximin']
  s.email = 'christophe.maximin@gmail.com'
  s.homepage = 'https://github.com/christophemaximin/crystal_flash_messages'
  s.licenses = ['MIT']

  s.platform = Gem::Platform::RUBY

  s.add_development_dependency 'rake', '~> 11.3'
  s.add_development_dependency 'rspec', '~> 3.5'
  s.add_development_dependency 'guard-rspec', '~> 4.7'
  s.add_development_dependency 'guard-rubocop', '~> 1.2'
  s.add_development_dependency 'rb-inotify', '~> 0.9'
  s.add_development_dependency 'rb-fsevent', '~> 0.9'
  s.add_development_dependency 'rb-fchange', '~> 0'
  s.add_development_dependency 'rails', '~> 5.0'

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split('\n').map do |f|
    File.basename(f)
  end

  s.require_paths = ['lib']
end
