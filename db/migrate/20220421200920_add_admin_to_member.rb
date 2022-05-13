class AddAdminToMember < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :admin, :boolean, default: false
  end
end
