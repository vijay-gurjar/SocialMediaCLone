class AddCommentFields < ActiveRecord::Migration[7.0]
  def change
    add_column :comments , :member_id, :integer
  end
end
