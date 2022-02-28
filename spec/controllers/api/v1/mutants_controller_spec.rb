# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::MutantsController, type: :controller do

  describe "#create" do
    context "when the DNA is from a mutant" do
      it "returns the mutants details" do
        post :create, params: { use_route: "api/v1/", dna: ["", ""] }
        expect(response).to be_successful
      end
    end
  end
end
