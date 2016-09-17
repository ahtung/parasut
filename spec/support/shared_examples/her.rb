RSpec.shared_examples 'her model' do
  # Class methods
  describe '.' do
    describe 'all' do
      it described_class do
        expect(described_class.all.length).not_to eq(0)
      end
    end

    describe 'create' do
      it "a new #{described_class}" do
        skip if %w(Parasut::Account).include? described_class.name
        expect(described_class.create(name: 'Test')).to be_instance_of(described_class)
      end
    end

    describe 'find' do
      it "an #{described_class} instance" do
        expect(described_class.find(1)).to be_instance_of(described_class)
      end
    end

    describe 'total_pages' do
      it 'returns 1' do
        collection = described_class.all
        expect(collection.total_pages).to eq(1)
      end
    end
  end

  # Instance methods
  describe '#' do
    describe 'destroy' do
      it "a #{described_class}" do
        skip if %w(Parasut::Account).include? described_class.name
        contact = described_class.find(1)
        expect(contact.destroy).to be_instance_of(described_class)
      end
    end
  end
end
