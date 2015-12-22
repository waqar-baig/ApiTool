class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :base_url
      t.references :user
      t.text :description

      t.timestamps null: false
    end
  end
end
