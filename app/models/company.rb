class Company < ActiveRecord::Base
	has_and_belongs_to_many :industries
	has_many :seo_keywords
	has_many :products
	has_many :employees
  has_many :regist_infos
  acts_as_sphinx :index => "idx_boast_companies"
  
  upload_column :logo,:store_dir => proc{|record| "images/#{record.id}"}  	                     
  upload_column :banner,:store_dir => proc{|record| "images/#{record.id}"}
  	
#  validates_presence_of :name, :found, :webaddress,:legalperson ,:address,:introduction 
#  validates_uniqueness_of :name

  validates_uniqueness_of :name, :message => "该公司已存在！"
  validates_presence_of     :name,:message => "公司名称不能为空！"

end
