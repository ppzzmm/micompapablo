# frozen_string_literal: true

# This class creates a new human with its details
module Mutants
  class Create
    include ErrorHelper

    def initialize(dna)
      @dna = dna
    end

    def self.run(dna)
      new(dna).run
    end

    def run
      result = Mutants::Detect.run(dna)
      return resolution(false, :human_registered) if human?

      Human.create(dna: dna, mutant: result.success?)
      result
    end

    private

    attr_reader :dna

    def human?
      Human.find_by(dna: dna)
    end

    def errors
      {
        human_registered: 'The DNA was created before'
      }
    end
  end
end
