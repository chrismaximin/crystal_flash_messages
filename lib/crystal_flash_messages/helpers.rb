module CrystalFlashMessages
  module Helpers
    include ActionView::Helpers::TagHelper

    def crystal_flash_messages(options = {})
      return '' if flash.empty?
      config = local_config(options)

      flash.map do |key, message|
        wrapper(key.to_s, message, config)
      end.join.html_safe
    end

    private

    def wrapper(key, message, config)
      class_attr = wrapper_class_attr(key, config)

      content_tag(:div, class: class_attr, role: 'alert') do
        message
      end
    end

    def wrapper_class_attr(key, config)
      boostrap_translations = { 'error' => 'danger', 'notice' => 'info' }
      boostrap_translations.default = key
      base = []
      base << 'alert'
      base << 'alert-' + boostrap_translations[key]
      base << 'flash-' + key
      base << config.additional_classes unless config.additional_classes == ''
      base.join(' ')
    end

    def local_config(options)
      config = CrystalFlashMessages.configuration.clone
      options.each_pair do |k, v|
        config.send(k.to_s + '=', v)
      end
      config
    end
  end
end
