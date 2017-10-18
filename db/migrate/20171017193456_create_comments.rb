class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :job, index: true, foreign_key: true

      t.timestamp
    end
  end
end