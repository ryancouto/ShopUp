# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  shop_id    :integer          not null
#  user_id    :integer          not null
#  title      :string
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ActiveRecord::Base

  validates :body, :shop_id, :user_id, presence: true

  belongs_to :shop

  belongs_to :user

end
