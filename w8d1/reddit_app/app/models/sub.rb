# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :text             not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, :description, :user_id, presence: true
    validates :title, uniqueness: true

    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User
end
