class AddAdminFlagToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.boolean :is_admin, default: false
    end
  end
end
