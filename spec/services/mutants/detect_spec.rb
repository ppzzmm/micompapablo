# frozen_string_literal: true

require 'rails_helper'

describe Mutants::Detect do
  let(:mutant_dna) do
    %w[ATGCGA CAGTGC TTATGT AGAAGG CCCCTA TCACTG]
  end

  let(:human_dna) do
    %w[ATGCGA CNGTGC TTATGT AGAAGG ZZZZTA TCACTG]
  end

  context 'when passed a valid DNA' do
    it 'returns true' do
      result = described_class.run(mutant_dna)
      expect(result.success?).to be(true)
    end
  end

  context 'when the DNA is not valid' do
    it 'returns an error' do
      result = described_class.run(nil)
      expect(result.success?).to be(false)
      expect(result.error_message).to eq('The data is not DNA.')
    end
  end

  context 'when the DNA is from human' do
    it 'returns an error' do
      result = described_class.run(human_dna)
      expect(result.success?).to be(false)
      expect(result.error_message).to eq('It is not mutant.')
    end
  end
end
