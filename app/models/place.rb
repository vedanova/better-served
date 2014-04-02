class Place < ActiveRecord::Base
  belongs_to :premise
  has_many :items, dependent: :destroy
  validates :name, presence: true, length: {in: 1..256},
            uniqueness: {scope: :premise}
  validate :uuid, presence: true, uniqueness: true
  before_validation :set_uuid, on: :create

  private
  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
