# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :text
#  image_url  :text
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ArtworkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
