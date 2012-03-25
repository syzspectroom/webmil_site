# == Schema Information
#
# Table name: works
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  url               :string(255)
#  main_image        :string(255)
#  short_description :text
#  description       :text
#  show_on_mine_page :boolean
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#

require 'spec_helper'

describe Work do
  pending "add some examples to (or delete) #{__FILE__}"
end
