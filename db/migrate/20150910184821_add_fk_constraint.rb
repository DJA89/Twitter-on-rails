class AddFkConstraint < ActiveRecord::Migration
  def change

  	add_foreign_key :tweets, :users

  end
end
