class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :pin
      t.string :email
      t.string :tel
      t.string :address

      t.timestamps
    end
  end
end
