class Place < ActiveRecord::Base
  belongs_to :premise
  has_many :items, dependent: :destroy
  validates :name, presence: true, length: {in: 1..256},
            uniqueness: {scope: :premise}
end
