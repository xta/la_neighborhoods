class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :neighborhood, index: true
      t.text :raw_xml
      t.string :heading

      t.timestamps
    end
  end
end
