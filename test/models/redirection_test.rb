# == Schema Information
#
# Table name: redirections
#
#  id              :bigint           not null, primary key
#  destination_url :string
#  source_path     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class RedirectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
