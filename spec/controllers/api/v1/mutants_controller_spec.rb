# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::MutantsController, type: :controller do
  let(:mutant_dna) do
    %w[ATGCGA CAGTGC TTATGT AGAAGG CCCCTA TCACTT]
  end

  describe '#create' do
    context 'when the DNA is from a mutant' do
      it 'returns the code 200' do
        result = OpenStruct.new(success?: true)
        allow(Mutants::Create).to receive(:run).and_return(result)
        post :create, params: { use_route: 'api/v1/', dna: mutant_dna }
        expect(response).to be_successful
      end
    end
  end
end
