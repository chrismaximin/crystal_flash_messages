module CrystalFlashMessages
  class Railtie < ::Rails::Railtie
    initializer 'crystal_flash_messages' do |_app|
      ActiveSupport.on_load(:action_view) do
        require 'crystal_flash_messages/helpers'
        include CrystalFlashMessages::Helpers
      end
    end
  end
end
