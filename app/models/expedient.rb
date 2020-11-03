class Expedient < ApplicationRecord
  has_many :notifications
  accepts_nested_attributes_for :notifications
end
