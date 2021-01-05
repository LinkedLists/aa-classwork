require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  
  @@color_list = %w(white black orange striped brown)
  @color_list = @@color_list
  validates :color, presence: true, inclusion: { in: @@color_list}
  validates :sex, presence: true, inclusion: { in: ["M", "F"] }
  validates :birth_date, presence: true
  validates :name, presence: true
  attr_reader :color_list

  def age
    Time.now.year - @birth_date.year
  end

  def self.color_list
    @@color_list
  end

  def self.attributes
    Cat.new.attributes.keys
  end
end
