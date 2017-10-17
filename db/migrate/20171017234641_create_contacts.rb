class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.text :position
      t.text :email
      t.references :company, index: true, foreign_key: true

      t.timestamp
    end
  end
end
