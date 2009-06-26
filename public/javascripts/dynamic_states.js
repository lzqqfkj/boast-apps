
function change(levelone_id,leveltwo_id)   
{   
    new Ajax.Request(   
    '/city/getCity/'+$(levelone_id).value,          
    {          
        method: 'get',          
        requestHeaders:{Accept:'application/json'},   
        onComplete: function showResponse(transport)   
        {   
            var json = eval(transport.responseText);          
            $(leveltwo_id).options.length=1;          
            for(var i=0;i<json.length;i++)   
            {                   
                var oNewNode=new Option();          
                oNewNode.value=json[i].city.id;          
                oNewNode.text=json[i].resource.resource_name;          
                $(leveltwo_id).options.add(oNewNode);   
            }               
        },   
        asynchronous:true,    
        evalScripts:true          
    });        
}  
 
