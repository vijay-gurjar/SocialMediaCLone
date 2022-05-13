class Addnametosubject < ActiveRecord::Migration[7.0]
  def change
    add_column :subjects, :first_name, :string
    add_column :subjects, :last_name, :string

  end
end
