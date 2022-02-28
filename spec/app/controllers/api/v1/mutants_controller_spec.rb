# frozen_string_literal: true

require "rails_helper"

RSpec.describe 'Api/v1/mutants' do
  describe 'POST' do
    context 'when the params are correct' do
      it 'creates the mutant' do
        post 'api/v1/mutants'
        expect(response).to be_successful
      end
    end
  end
end
