class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  scope :pname, -> (input_name) { where("name like ?", "%#{input_name}%") }
  scope :pprice, -> (input_price) { where price: input_price }
  scope :pimage, -> (input_image) { where("image like ?", "%#{input_image}%") }
  scope :pstatus, -> (input_status) { where status: input_status }

end
