# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_ids    :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  validates :title, :sub_ids, :user_id, presence: true
  
  # def sub_ids=(arr)
  #   debugger
  #   arr.each do |sub_id|
  #     PostSub.create(sub_id: sub_id, post_id: self.id)
  #   end
  # end

  belongs_to :author,
  foreign_key: :user_id,
  class_name: :User

  has_many :post_subs, 
  inverse_of: :post,
  foreign_key: :post_id,
  class_name: :PostSub

  has_many :subs,
  through: :post_subs,
  source: :sub


end
