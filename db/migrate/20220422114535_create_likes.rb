class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :member, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
    add_index :likes, [:member_id, :subject_id], unique: true
  end
end
