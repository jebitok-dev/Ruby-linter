require_relative '../lib/checker'
require 'rspec'

describe CheckErrors do
    let(:check) {CheckErrors.new('bad.rb')}

    describe '#trailing_space' do
        it 'return trailing space error' do
            check.trailing_space
            expect(check.errors[0]).to eql('line:2:33: Error: Trailing whitespace detected.')
        end
    end

    describe '#check_identation' do
        it 'return identation errors' do
            check.check_identation
            expect(check.errors[0]).to eql('line:4 IdentWidth: Use 2 spaces for identation.')
        end
    end

    describe '#check_end_empty_line' do
        it 'return empty end line error' do
            check.check_end_empty_line
            expect(check.errors[0]).to eql('Line:23 Extra empty line detected at block body end')
        end
    end

    describe '#end_error' do
        it 'return end errors' do
            check.end_error
            expect(check.errors[0]).to eql("Lint/Syntax: Unexpected 'end'")
        end
    end

    describe '#check_tag_error' do
        it 'return tag errors' do
            check.check_tag_error
            expect(check.errors[0]).to eql("line:21 Lint/Syntax: Unexpected/MIssing token '(' Parenthesis")
        end
    end

    describe '#empty_line' do
        it 'return empty line errors' do
            check.empty_line
            expect(check.errors[0]).to eql('line:23 Extra empty line detected at the end of block body')
        end
    end
end