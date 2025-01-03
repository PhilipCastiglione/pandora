# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  drawn_on   :date
#  idea       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Activity < ApplicationRecord
  has_rich_text :description

  has_and_belongs_to_many :tags

  def draw!
    update(drawn_on: Date.current)
  end
end
