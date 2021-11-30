# frozen_string_literal: true

RSpec.describe Alltodo do
  it "has a version number" do
    expect(Alltodo::VERSION).not_to be nil
  end

  describe Alltodo::MdFormatter do
    describe 'run' do
      it 'return formatted todo' do
        result = Alltodo::MdFormatter.new.run('New todo')
        expect = '- [ ] New todo'
        expect(result).to eq(expect)
      end
    end
  end
end
