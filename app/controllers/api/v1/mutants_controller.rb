# frozen_string_literal: true

class Api::V1::MutantsController < Api::V1::BaseController
  protect_from_forgery with: :null_session
  before_action :find_user

  def create
    binding.pry
    response_success code: 200
  end

  private

  def mutants_params
    params.require(:dna)
  end

  def find_user
    @user = 'user'
  end
end