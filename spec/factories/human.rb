# frozen_string_literal: true

FactoryBot.define do
  factory :human do
    dna { %w[ATGCGA CAGTGC TTATGT AGAAGG CCCCTA TCACTG] }
    mutant { true }
  end
end
