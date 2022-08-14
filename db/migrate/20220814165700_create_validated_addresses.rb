class CreateValidatedAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :validated_addresses do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip5
      t.string :zip4
      t.integer :user_id

      t.timestamps
    end
  end
end
