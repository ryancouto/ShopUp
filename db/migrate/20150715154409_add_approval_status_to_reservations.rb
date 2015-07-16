class AddApprovalStatusToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :approved, :boolean
  end
end
