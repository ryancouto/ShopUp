# == Schema Information
#
# Table name: shops
#
#  id          :integer          not null, primary key
#  owner_id    :integer          not null
#  address     :string           not null
#  city        :string           not null
#  description :text
#  price       :integer          not null
#  size        :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Shop < ActiveRecord::Base

	validates :owner_id, :address, :city, :price, :size, presence: true

	belongs_to :owner,
		class: "User",
		foreign_key: :owner_id,
		primary_key: :id

	has_many :reservations

end
