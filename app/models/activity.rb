# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  done_on    :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Activity < ApplicationRecord
  has_rich_text :description
end
