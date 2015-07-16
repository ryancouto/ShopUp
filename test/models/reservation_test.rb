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

require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
