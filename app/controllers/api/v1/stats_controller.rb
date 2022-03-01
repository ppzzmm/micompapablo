# frozen_string_literal: true

class Api::V1::StatsController < Api::V1::BaseController
  protect_from_forgery with: :null_session
  before_action :find_humen
  before_action :find_mutants

  def show
    @mutants
  end

  private

  def find_humen
    @humen = Human.where(mutant: false).count
  end

  def find_mutants
    @mutants = Human.where(mutant: true).count
  end
end
