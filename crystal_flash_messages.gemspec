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

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split('\n').map do |f|
    File.basename(f)
  end

  s.require_paths = ['lib']
end
