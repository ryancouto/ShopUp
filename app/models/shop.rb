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

	has_attached_file :image, default_url: "No-image-found.jpg"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	validates :owner_id, :address, :city, :price, :size, presence: true

	geocoded_by :full_address
	after_validation :geocode

	belongs_to :owner,
		class: "User",
		foreign_key: :owner_id,
		primary_key: :id

	has_many :reservations

	has_many :reviews

	def full_address
		self.address + ', ' + self.city
	end

end
