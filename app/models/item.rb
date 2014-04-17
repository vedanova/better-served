class Item < ActiveRecord::Base

  has_many :requests
  has_many :feedbacks
  has_many :orders
  has_many :bills
  belongs_to :place
  validate :name, presence: true, length: {in: 1..256}
  validate :uuid, presence: true, uniqueness: true

  attr_accessor :item_count
  before_validation :set_uuid, on: :create
  before_create :create_qr_data_url


  def qr
    url = "http://#{ENV['DOMAIN']}/q/#{uuid}"
    qr = RQRCode::QRCode.new(url, size: 8, level: :h)
    qr.to_img
  end

  def qr_image_link(size = nil)
    png = qr
    png = qr.resize(size, size) if size
    png.to_data_url
  end

  def qr_file_name()
    name.gsub(/\s/, '_')
  end
  private

  def set_uuid
    self.uuid = SecureRandom.uuid
  end

  def create_qr_data_url
    self.qr_data_url = qr_image_link(200)
  end


end
