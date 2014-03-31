class Place < ActiveRecord::Base
  belongs_to :premise

  validates :name, presence: true, length: {in: 1..256},
            uniqueness: {scope: :premise}
end
