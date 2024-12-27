# == Schema Information
#
# Table name: gifts
#
#  id         :integer          not null, primary key
#  event      :string
#  person     :string
#  purchased  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Gift < ApplicationRecord
  has_rich_text :description
end
