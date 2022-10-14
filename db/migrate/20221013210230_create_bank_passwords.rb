class CreateBankPasswords < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_passwords do |t|
      t.string :cardholder
      t.string :account_type
      t.string :bank_name
      t.string :franchise
      t.string :account_number
      t.string :secure_code
      t.datetime :expiration_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
