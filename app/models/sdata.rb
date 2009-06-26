class Sdata < ActiveRecord::Base
  validates_uniqueness_of :sid, :message => "此id已存在!"
  validates_presence_of   :sname,:message => "名称不能为空!" 
end
