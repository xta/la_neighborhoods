class CreateCrimes < ActiveRecord::Migration
  def change
    create_table :crimes do |t|
      t.references :neighborhood, index: true
      t.integer :rank
      t.float :per_capita
      t.integer :total

      t.timestamps
    end
  end
end
