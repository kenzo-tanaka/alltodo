# frozen_string_literal: true

RSpec.describe Alltodo do
  it "has a version number" do
    expect(Alltodo::VERSION).not_to be nil
  end

  describe Alltodo::MdFormatter do
    describe 'run' do
      it 'return formatted todo' do
        expect(Alltodo::MdFormatter.new.run('New todo')).to eq('- [ ] New todo')
      end
    end
  end

  describe Alltodo::StackTodo do
    let(:path) { 'stack.md' }

    describe 'add' do
      let(:text) do
        <<~TEXT.chomp
          - [ ] Old todo1
          - [ ] Old todo2
          - [ ] Old todo3
          - [ ] New todo
        TEXT
      end
      before 'setup file content' do
        File.open(path, 'w') do |f|
          f << <<~TEXT
            - [ ] Old todo1
            - [ ] Old todo2
            - [ ] Old todo3
          TEXT
        end
      end

      after 'clean up file content' do
        File.open(path, 'w')
      end
      it 'write todo to stack' do
        Alltodo::StackTodo.new.add('- [ ] New todo')
        expect(File.read(path)).to eq text
      end
    end

    describe 'all' do
      let(:text) do
        <<~TEXT
          - [ ] Buy coffee
          - [ ] Read tech book
          - [ ] Running
          - [ ] Develop personal project
        TEXT
      end

      before 'setup file content' do
        File.open(path, 'w') { |f| f << text }
      end

      after 'clean up file content' do
        File.open(path, 'w')
      end

      it 'returns all stack tasks' do
        result = Alltodo::StackTodo.new.all
        expect(result).to eq text
      end
    end
  end
end
