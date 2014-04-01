class Item < ActiveRecord::Base
  belongs_to :place
  validate :name, presence: true, length: {in: 1..256}
  validate :uuid, presence: true, uniqueness: true

  attr_accessor :item_count
  before_validation :set_uuid, on: :create


  def qr
    url = "http://#{ENV['DOMAIN']}/q/#{uuid}"
    puts url
    RQRCode::QRCode.new(url, size: 10, level: :h)
  end

  private

  def set_uuid
    self.uuid = SecureRandom.uuid
  end


end
