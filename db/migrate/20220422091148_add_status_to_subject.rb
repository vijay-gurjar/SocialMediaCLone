class AddStatusToSubject < ActiveRecord::Migration[7.0]
  def change
    add_column :subjects, :status, :string
  end
end
