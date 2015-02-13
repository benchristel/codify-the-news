require_relative '../lib/identifier_replacer'

describe IdentifierReplacer do
  let(:code) do
    %q^this.is(someCode)^
  end

  let(:words) do
    ['the', 'bear', 'car']
  end

  it 'replaces the code with the words' do
    expect(IdentifierReplacer.replace(code, words)).to eq 'the.bear(car)'
  end
end
