class ProfileImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "user.png"
  end
  process resize_to_fit: [300, 300]

  version :thumb do
    process resize_to_fit: [300, 300]
  end

  def extension_whitelist
    %w[jpg jpeg png]
  end
end
