class Organisation < ActiveRecord::Base
  validates :name, presence: true
  has_many :premises, dependent: :destroy
  has_many :users
  has_one :owner, -> {where role: 'owner'}, class_name: 'User'
end
