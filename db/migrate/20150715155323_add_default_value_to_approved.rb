class AddDefaultValueToApproved < ActiveRecord::Migration
  def change
    change_column :reservations, :approved, :boolean, default: false
  end
end
