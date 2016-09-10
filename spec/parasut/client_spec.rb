require 'spec_helper'

RSpec.describe Parasut::Client do
  subject { described_class.new }

  it 'should have API_VERSION defined' do
    expect(Parasut::Client.const_defined?('API_VERSION')).not_to be_nil
  end

  describe '#' do
    describe 'me' do
      it 'should return 200' do
        expect(described_class.me.code).to eq(200)
      end
    end
  end
end
