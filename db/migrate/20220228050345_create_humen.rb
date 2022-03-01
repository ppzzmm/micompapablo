# frozen_string_literal: true

class CreateHumen < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        create_table :humen do |t|
          t.boolean :mutant
          t.string :dna, array: true, default: []

          t.timestamps
        end
      end
      dir.down do
        drop_table :humen
      end
    end
  end
end
