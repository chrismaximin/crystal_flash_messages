require 'spec_helper'
require 'ostruct'

module CrystalFlashMessages
  module Helpers
    mattr_accessor :injected_flash

    def flash
      @@injected_flash
    end
  end
end

def assign_flash(value)
  CrystalFlashMessages::Helpers.injected_flash = value
end

describe 'Helpers' do
  describe '#crystal_flash_messages' do
    include CrystalFlashMessages::Helpers
    attr_accessor :output_buffer

    let(:mock_empty_flash) { {} }
    let(:mock_flash) { { notice: 'You are now logged in.' } }
    let(:mock_flash_with_two_messages) do
      mock_flash.merge(error: 'Your account will soon expire.')
    end
    let(:mock_flash_with_random_key) { { foo: 'Bar.' } }

    it 'returns nothing if there are no messages' do
      assign_flash(mock_empty_flash)
      result = crystal_flash_messages
      expect(result).to eql('')
    end

    context 'with default configuration' do
      it 'renders correctly with one message' do
        assign_flash(mock_flash)
        result = crystal_flash_messages
        expect(result).to eql(
          '<div class="alert alert-info flash-notice" role="alert">' \
          'You are now logged in.' \
          '</div>'
        )
      end

      it 'renders correctly with two messages' do
        assign_flash(mock_flash_with_two_messages)
        result = crystal_flash_messages
        expect(result).to eql(
          '<div class="alert alert-info flash-notice" role="alert">' \
          'You are now logged in.' \
          '</div>' \
          '<div class="alert alert-danger flash-error" role="alert">' \
          'Your account will soon expire.' \
          '</div>'
        )
      end
    end

    context 'with a custom configuration' do
      let(:configuration) { CrystalFlashMessages.configuration }
      let(:options) { { additional_classes: 'xxx' } }
      let(:result) { crystal_flash_messages(options) }

      it 'renders correctly' do
        assign_flash(mock_flash_with_random_key)
        expect(result).to eql(
          '<div class="alert alert-foo flash-foo xxx" role="alert">' \
          'Bar.' \
          '</div>'
        )
      end
    end
  end
end
