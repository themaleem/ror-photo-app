class Image < ApplicationRecord
  belongs_to :user
  # associate image uploaded with the PictureUploader to this model with carrierwave
  # :picture field of type string in image model
  mount_uploader :picture, PictureUploader
  validate :picture_size

  private

  def picture_size
    error.add(:picture, 'should be less tha 2 MB') if picture.size > 2.megabytes
  end
end
