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

require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
