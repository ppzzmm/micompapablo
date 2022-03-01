# frozen_string_literal: true

json.dna do
  json.count_mutant_dna @mutants
  json.count_human_dna @humen
  json.ratio @humen.zero? ? 0 : @mutants / @humen
end
