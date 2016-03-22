class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description
  has_attached_file :thumbnail, styles: { medium: "1000x1000>", thumb: "300x300>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
end

#access_token: a7c16cd699d36354234cd7e6a594f3b3b14b1c2e
#refresh_secret: ccd52bd5bee2a7c2bea2255f3d32aebc158979af