class Product < ActiveRecord::Base
  belongs_to :company
  has_many:post_infos
  upload_column :picture,:store_dir => proc{|record| "images/#{record.company_id}"}
  	
#  validates_uniqueness_of :name, :message => "该产品名已存在!"
  validates_presence_of     :name,:message =>"不能为空"      #:empty 
#  validates_uniqueness_of :title, :message => "该产品标题已存在!"
  validates_presence_of     :title,:message => "产品标题不能为空!"  
  validates_length_of       :Introduction,:minimum => 15,:message => "产品简介长度须为15到150个字符!"	  
  
  before_save :save_price
  
  def save_price
    self.price = self.price * 10000
  end
                     
end
