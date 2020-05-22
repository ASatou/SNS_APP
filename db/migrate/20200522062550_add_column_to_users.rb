class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile, :string
    add_column :users, :website, :string
    add_column :users, :tel, :string
    add_column :users, :sex, :string
  end
end
