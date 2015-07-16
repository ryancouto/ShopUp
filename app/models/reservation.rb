# == Schema Information
#
# Table name: reservations
#
#  id         :integer          not null, primary key
#  owner_id   :integer          not null
#  renter_id  :integer          not null
#  shop_id    :integer          not null
#  start_day  :date             not null
#  end_day    :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  approved   :boolean          default(FALSE)
#

class Reservation < ActiveRecord::Base

	validates :owner_id, :renter_id, :shop_id, :start_day, :end_day, presence: true
	validate :owner_and_renter
	validate :start_before_end
	validate :correct_owner

	belongs_to :shop

	belongs_to :renter,
		class_name: "User",
		foreign_key: :renter_id,
		primary_key: :id

	belongs_to :owner,
		class_name: "User",
		foreign_key: :owner_id,
		primary_key: :id

	def start_before_end
		if self.start_day >= self.end_day
			errors.add[:error, "Invalid dates"]
		end
	end

	def owner_and_renter
		if self.owner_id == self.renter_id
			errors.add[:error, "You can't rent your own shop"]
		end
	end

	def correct_owner
		shop = Shop.find(self.shop_id)
		if self.owner_id != shop.owner_id
			errors.add[:error, "Wrong owner"]
		end
	end

end
