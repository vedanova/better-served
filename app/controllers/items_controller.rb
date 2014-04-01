class ItemsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :setup_place, only: [:index, :download, :download_all]

  def index
    @items = @place.items
  end

  def show
  end

  def create
  end

  def delete
  end

  def update
  end

  def download
    @item = @place.items.find(download_params[:id])
    send_data @item.qr.resize(400, 400), type: "image/png", filename: @item.qr_file_name
  end

  def download_all
    require 'zip/zip'
    items = @place.items
    path = "/tmp/#{@place.name}_qr_codes.zip"
    #stringio = Zip::ZipOutputStream.write_buffer do |zio|
    #  items.each do |item|
    #    zio.put_next_entry(item.qr_file_name + ".png")
    #    zio.write item.qr.resize(400, 400)
    #  end
    #end
    #stringio.rewind
    #binary_data = stringio.sysread
    #send_data binary_data, type: "application/zip", filename: "#{@place.name}_qr_codes.zip"

    Zip::ZipFile.open(path, Zip::ZipFile::CREATE) { |zipfile|
      items.each do |item|
        zipfile.get_output_stream(item.qr_file_name + ".png") { |f| f.puts item.qr.resize(400, 400) }
      end
    }
    send_file path, type: "application/zip"
  end


  protected

  def setup_place
    #TODO restrict to user
    @place = Place.find(params[:place_id])
  end

  def download_params
    params.permit(:id, :place_id)
  end

  def item_params
    params[:item].permit(:id)
  end

end
