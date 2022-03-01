# frozen_string_literal: true

# This class detects a new mutan with its DNA
module Mutants
  class Detect
    include ErrorHelper

    VALID_LETTERS = %w[A T C G].freeze

    def initialize(dna)
      @dna = dna
      @sequences = 0
    end

    def self.run(dna)
      new(dna).run
    end

    def run
      return resolution(false, :not_dna) unless dna.is_a?(Array) && dna&.any?

      find_sequences
      return resolution(false, :not_mutant) if @sequences < 2

      resolution(true, nil)
    end

    private

    attr_reader :dna, :sequences

    def find_sequences
      horizontal
      vertical
      oblique
    end

    def horizontal
      dna.each do |row|
        process(row.chars)
      end
    end

    def vertical
      rows = {}
      dna.each_with_index do |row, _index|
        row.chars.each_with_index do |letter, letter_index|
          rows[letter_index.to_s] = [] if rows[letter_index.to_s].nil?
          rows[letter_index.to_s] << letter
        end
      end
      rows.each do |_key, value|
        process(value)
      end
    end

    def oblique
      rows = {}
      column = 0
      additional_rows = dna.first.length
      dna.each_with_index do |row, index|
        row.chars.each_with_index do |letter, letter_index|
          rows[letter_index.to_s] = [] if rows[letter_index.to_s].nil?
          value = index.zero? ? letter : row.chars[letter_index + column]
          rows[letter_index.to_s] << value
        end
        column += 1
        next if index.zero?

        rows[additional_rows.to_s] = [] if rows[additional_rows.to_s].nil?
        last_rows = dna[index..(dna.length - 1)]
        next_column = 0
        last_rows.each do |next_row|
          rows[additional_rows.to_s] << next_row[next_column]
          next_column += 1
        end
        additional_rows += 1
      end

      rows.each do |_key, value|
        process(value)
      end
    end

    def process(chars)
      letter = ''
      equals = 1
      chars.each do |value|
        next unless VALID_LETTERS.include?(value)

        equals = 0 if letter != value
        if letter == value
          equals += equals.zero? ? 2 : 1
        end
        @sequences += 1 if equals == 4
        letter = value
      end
    end

    def errors
      {
        not_dna: 'The data is not DNA.',
        not_mutant: 'It is not mutant.'
      }
    end
  end
end
