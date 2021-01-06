class Album < ApplicationRecord
  validates :band_id, presence: :true, uniqueness: :true
  validates :title, :year, presence: :true 

  belongs_to :band,
  primary_key: :id,
  foreign_key: :band_id,
  class_name: :Band
end
