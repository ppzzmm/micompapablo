# frozen_string_literal: true

class Api::V1::MutantsController < Api::V1::BaseController
  protect_from_forgery with: :null_session

  def create
    result = Mutants::Create.run(mutants_params)
    return response_error message: result.error_message unless result.success?

    response_success code: 200
  end

  private

  def mutants_params
    params.require(:dna)
  end
end
