class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :project, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
