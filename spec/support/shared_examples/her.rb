RSpec.shared_examples 'her model' do
  # Class methods
  describe '.' do
    describe 'all' do
      it 'returns all contacts' do
        expect(described_class.all.length).not_to eq(0)
      end
    end

    describe 'create' do
      it 'creates a new contact' do
        expect(described_class.create(name: 'Test')).to be_instance_of(described_class)
      end
    end

    describe 'find' do
      it 'returns a contact instance' do
        expect(described_class.find(1)).to be_instance_of(described_class)
      end
    end
  end

  # Instance methods
  describe '#' do
    describe 'destroy' do
      it 'destroy a contact' do
        contact = described_class.find(1)
        expect(contact.destroy).to be_instance_of(described_class)
      end
    end
  end
end
