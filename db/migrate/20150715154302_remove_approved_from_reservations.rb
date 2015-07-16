class RemoveApprovedFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :approved?
  end
end
