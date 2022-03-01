# frozen_string_literal: true

require 'rails_helper'
require 'json_matchers/rspec'

RSpec.describe Api::V1::StatsController, type: :controller do
  render_views

  describe '#show' do
    context 'when there are humen and mutants' do
      it 'returns the stats' do
        get :show, format: :json, params: { use_route: 'api/v1/', id: '1' }
        expect(response).to be_successful
        expect(JSON.parse(response.body)).to match_response_schema('stats_response', strict: true)
      end
    end
  end
end
