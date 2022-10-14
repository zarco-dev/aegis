class CreatePasswords < ActiveRecord::Migration[7.0]
  def change
    create_table :passwords do |t|
      t.text :url
      t.string :site_name
      t.string :category
      t.string :site_username
      t.string :site_password
      t.boolean :group
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
