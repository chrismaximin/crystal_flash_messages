require 'spec_helper'

describe 'CrystalFlashMessages::Configuration' do
  let(:klass) { CrystalFlashMessages }
  subject { klass.configuration }

  it 'can be set by a block' do
    klass.configure do |config|
      config.additional_classes = 'test'
    end

    expect(subject.additional_classes).to eql('test')
  end

  it 'can be set individually' do
    subject.additional_classes = 'test'
    expect(subject.additional_classes).to eql('test')
  end

  it 'can be resetted' do
    subject.additional_classes = 'test'
    expect(subject.additional_classes).to eql('test')

    subject.reset

    expect(subject.additional_classes).not_to eql('test')
  end
end
