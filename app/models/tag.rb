# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  validates :label, presence: true, uniqueness: true

  has_and_belongs_to_many :activities
end
