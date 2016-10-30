require 'cgi'

module CrystalFlashMessages
  module Helpers
    def crystal_flash_messages(options = {})
      return '' if flash.empty?
      private_helpers = CrystalFlashMessages::PrivateHelpers

      config = private_helpers.local_config(options)
      flash.map do |key, message|
        private_helpers.wrapper(key.to_s, message, config)
      end.join.html_safe
    end
  end

  module PrivateHelpers
    def self.wrapper(key, message, config)
      class_attr = wrapper_class_attr(key, config)
      tag(:div, message, class: class_attr, role: 'alert')
    end

    def self.wrapper_class_attr(key, config)
      boostrap_translations = { 'error' => 'danger', 'notice' => 'info' }
      boostrap_translations.default = key
      base = []
      base << 'alert'
      base << 'alert-' + boostrap_translations[key]
      base << 'flash-' + key
      base << config.additional_classes unless config.additional_classes == ''
      base.join(' ')
    end

    def self.local_config(options)
      config = CrystalFlashMessages.configuration.clone
      options.each_pair do |k, v|
        config.send(k.to_s + '=', v)
      end
      config
    end

    def self.tag(name, value, attributes = {})
      string_attributes = attributes.inject('') do |attrs, pair|
        unless pair.last.nil?
          attrs << %( #{pair.first}="#{CGI.escapeHTML(pair.last.to_s)}")
        end
        attrs
      end
      "<#{name}#{string_attributes}>#{value}</#{name}>"
    end
  end
end
