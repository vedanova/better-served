class Premise < ActiveRecord::Base
  belongs_to :organisation
  has_many :places, dependent: :destroy
  accepts_nested_attributes_for :places
  validates :name, presence: true, length: {in: 1..256}, uniqueness: {scope: :organisation}
  validates :organisation, presence: true
end