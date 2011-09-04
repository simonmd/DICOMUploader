require 'carrierwave'
require 'sinatra'
require 'sqlite3'
require 'sequel'
require 'carrierwave/sequel'
require "awesome_print"
require File.join(Dir.pwd, "lib", "carrierwave", "edx", "dicom_module")

# POR FIN FUNCIONA!!! Faltaba esta pendejada que no esta en ninguna parte, especifica a Sinatra y Carrierwave ggrgr
CarrierWave.configure do |config| 
  config.root = "#{Dir.pwd}/public/" 
end

# database setup

DB = Sequel.sqlite

DB.create_table :uploads do
  String :file
end

# uploader

class MyUploader < CarrierWave::Uploader::Base
  include Edx::CarrierWave::Dicom
  storage :file
  process :dicomdata

  # Limit possible extensions
  def extension_white_list
    %w(dcm)
  end

  # Set the storage directory
  def store_dir
    "uploads"
  end
  
  version :thumb do
    process :dcm2jpg
  end

end

# model

class Upload < Sequel::Model
  mount_uploader :file, MyUploader
  def metadata
    self.dcmobj = Upload.dcmobj
  end
end

# sinatra app

get '/' do
  @uploads = Upload.all
  erb :index
end

post '/' do
  upload = Upload.new
  upload.file = params[:image]
  upload.save
  redirect to('/')
end