# == Schema Information
#
# Table name: blogs
#
#  id                 :integer(4)      not null, primary key
#  title              :string(255)
#  content            :text
#  category_id        :integer(4)
#  is_public          :boolean(1)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  public_datetime    :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

class Blog < ActiveRecord::Base
  
  validates :title , :presence => true
  validates :content , :presence => true
  validates :category_id , :presence => true

  belongs_to :categroy


end



