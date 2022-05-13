class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :title
      t.text :body
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
