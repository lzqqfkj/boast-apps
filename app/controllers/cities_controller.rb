class CitiesController < ApplicationController
  #include AuthenticatedSystem 
 
   def index_city   
     if params[:province_id] 
       province_id  = params[:province_id]
       @cities = City.find_by_sql("select * from cities where (id mod 100 =0 )and (id div 10000 = #{province_id} div 10000 ) and (id != #{province_id})").collect {|c| [c.cname, c.id]}.insert(0,["--请选择--",0])              
#       @cities =[["请选择城市",""]]+ City.find_by_sql("select * from cities where (id mod 100 =0 )and (id div 10000 = #{province_id} div 10000 ) and (id != #{province_id})").collect {|c| [c.cname, c.id]}   
     else
       @cities = City.find(:all).collect {|c| [c.cname, c.id]}    
     end
     respond_to do |format|      
       format.html { render :partial => params[:partial]}      
       format.xml { render :xml => @cities.to_xml }   
     end 
   end   
#     
   def index_area    
     if params[:city_id] 
       city_id  = params[:city_id]
#       @areas =City.find_by_sql("select * from cities where (id mod 100 =0 )and (id div 10000 = #{city_id} div 10000 ) and (id != #{city_id})").collect {|c| [c.cname, c.id]}
       @areas = City.find_by_sql("select * from cities where(id div 100 = #{city_id} div 100 ) and (id != #{city_id})").collect { |row| [row.cname,row.id] }.insert(0,["--请选择--",0])
     else      
       @areas = City.find(:all).collect {|c| [c.cname, c.id]}
     end   
     respond_to do |format|      
       format.html { render :partial => params[:partial]}      
       format.xml { render :xml => @areas.to_xml }   
     end 
   end   
end
