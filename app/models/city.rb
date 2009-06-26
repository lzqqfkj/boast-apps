class City < ActiveRecord::Base	

  def self.get_province_select_options   
     City.find_by_sql("select * from cities where (id mod 10000 =0 )").collect { |row| [row.cname,row.id] }.insert(0,["--请选择--",0])
  end 

  def self.get_city(province_id)
    @cities = City.find_by_sql("select * from cities where (id mod 100 =0 )and (id div 10000 = #{province_id} div 10000 ) and (id != #{province_id})").collect {|c| [c.cname, c.id]}.insert(0,["--请选择--",0])
  end
  
  def self.get_area(city_id)
    @areas = City.find_by_sql("select * from cities where(id div 100 = #{city_id} div 100 ) and (id != #{city_id})").collect { |row| [row.cname,row.id] }.insert(0,["--请选择--",0])
  end
end