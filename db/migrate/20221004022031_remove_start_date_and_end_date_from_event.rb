class RemoveStartDateAndEndDateFromEvent < ActiveRecord::Migration[7.0]
  def change
    change_table :events do |t|
      t.remove :start_date
      t.remove :end_date
    end
  end
end
