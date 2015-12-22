class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.references :api, index: true, foreign_key: true
      t.string :name
      t.string :field_type
      t.string :description

      t.timestamps null: false
    end
  end
end
