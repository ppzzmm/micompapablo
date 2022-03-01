# frozen_string_literal: true

require 'rails_helper'

describe Mutants::Create do
  let(:mutant_dna1) do
    %w[ATGCGA CAGTGC TTATGT AGAAGG CCCCTA TCACTT]
  end
  let(:mutant_dna2) do
    %w[ATGCGA CAGTGC TTATGT AGAAGG CCCCTA TCACTG]
  end

  context 'when passed a mutant DNA' do
    it 'creates a mutant' do
      result = OpenStruct.new(success?: true)
      allow(Mutants::Detect).to receive(:run).and_return(result)
      result = described_class.run(mutant_dna1)
      mutant = Human.find_by(mutant: true, dna: mutant_dna1)
      expect(result.success?).to be(true)
      expect(mutant).not_to be_nil
    end
  end

  context 'when the DNA was created before' do
    it 'returns an error' do
      result = described_class.run(mutant_dna2)
      expect(result.success?).to be(false)
      expect(result.error_message).to eq('The DNA was created before')
    end
  end
end
