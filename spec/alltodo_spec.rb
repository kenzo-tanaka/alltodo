# frozen_string_literal: true

RSpec.describe Alltodo do
  it "has a version number" do
    expect(Alltodo::VERSION).not_to be nil
  end

  describe Alltodo::MdFormatter do
    describe 'add' do
      it 'return formatted todo' do
        result = Alltodo::MdFormatter.new.add('New todo')
        expect = '- [ ] New todo'
        expect(result).to eq(expect)
      end
    end
  end
end
