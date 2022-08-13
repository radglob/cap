class CreateBasicInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :basic_infos do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.integer :user_id

      t.timestamps
    end
  end
end
