class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis do |t|
      t.references :service, index: true, foreign_key: true
      t.string :name
      t.string :request_type
      t.string :path
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
