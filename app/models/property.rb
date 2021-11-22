class Property < ApplicationRecord
  validates :name, presence: true
  validates :rent, presence: true
  validates :address, presence: true
  validates :age, presence: true
  has_many :stations
  accepts_nested_attributes_for :stations, allow_destroy: true, reject_if: :all_blank, update_only: true
end
