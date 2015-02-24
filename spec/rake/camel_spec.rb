require 'spec_helper'

describe Rake::Camel do
  it 'has a version number' do
    expect(Rake::Camel::VERSION).not_to be nil
  end

  it 'write some test' do
    expect(true).to eq(true)
  end
end
