# == Schema Information
#
# Table name: movieusers
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  provider   :string(255)
#  uid        :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'test_helper'

class MovieuserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
