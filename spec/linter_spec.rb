require_relative '../lib/linter'
require_relative '../lib/buffer'

describe Buffer do
  let(:check) { Linter.new }
  let(:lines) { File.open(file).to_a }
  let(:errors) { [] }
  let(:good_lines) { ['#head {', '  padding: 10px;', '}', "\n"] }
  let(:bad_lines) { ['#head{', "padding: 10px; \n", '}'] }

  describe '#self.check(file)' do
    it 'should be able to check a line in a css file and return results' do
      expect(check.trailing_space(good_lines, errors)).to eql([])
    end
    it 'should raise an error when there is a trailing white space' do
      expect(check.trailing_space(bad_lines, errors)).to eql(['Trailing space found on line 2.'])
    end
    it 'should return an empty array, correct indentation detected' do
      expect(check.indentation(good_lines, errors)).not_to eql([])
    end
    it 'should throw an error, when incorrect indentation is detected' do
      expect(check.indentation(bad_lines, errors)).to eql(errors)
    end
    it 'should return an empty array when a line has correct indentation' do
      expect(check.space_before_bracket(good_lines, errors)).to eql([])
    end
    it 'should throw an error when there is no space before bracket' do
      expect(check.space_before_bracket(bad_lines, errors)).to eql(errors)
    end
    it 'should return nil since the last line is empty' do
      expect(check.last_line(good_lines, errors)).to eql(nil)
    end
  end
end
