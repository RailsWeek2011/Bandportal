class AddFunctionToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :function, :string
  end
end
