# == Schema Information
#
# Table name: surveys
#
#  id          :integer          not null, primary key
#  response    :integer
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Survey do
  pending "add some examples to (or delete) #{__FILE__}"
end
