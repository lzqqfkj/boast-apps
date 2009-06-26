module CitiesHelper
  def get_area_select_options   
     City.find_by_sql("select * from cities where (id mod 10000 =0 )").collect { |row| [row.cname,row.id] }.insert(0,["«Î—°‘Ò..",nil])        
  end 

end