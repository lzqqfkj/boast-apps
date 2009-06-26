//<!-- 
//http://www.CodeBit.cn  
//--> 
function DrawImage(ImgD,FitWidth,FitHeight){     
	var image=new Image();
	image.src=ImgD.src;
	if(image.width>0 && image.height>0){
		if(image.width/image.height>= FitWidth/FitHeight){
			if(image.width>FitWidth){
				ImgD.width=FitWidth;
				ImgD.height=(image.height*FitWidth)/image.width;
			}else{
				ImgD.width=image.width;
				ImgD.height=image.height;
			}
		} else{
			if(image.height>FitHeight){
				ImgD.height=FitHeight;
				ImgD.width=(image.width*FitHeight)/image.height;
			}else{
				ImgD.width=image.width;
				ImgD.height=image.height;
			}
		}
		ImgD.style.marginTop = (FitHeight-ImgD.height)/2+"px";
	} 
}

function DrawImageNomargin(ImgD,FitWidth,FitHeight){     
	var image=new Image();
	image.src=ImgD.src;
	if(image.width>0 && image.height>0){
		if(image.width/image.height>= FitWidth/FitHeight){
			if(image.width>FitWidth){
				ImgD.width=FitWidth;
				ImgD.height=(image.height*FitWidth)/image.width;
			}else{
				ImgD.width=image.width;
				ImgD.height=image.height;
			}
		} else{
			if(image.height>FitHeight){
				ImgD.height=FitHeight;
				ImgD.width=(image.width*FitHeight)/image.height;
			}else{
				ImgD.width=image.width;
				ImgD.height=image.height;
			}
		}
	} 
}

function ExpandImage(ImgD,FitWidth,FitHeight){     
	var image=new Image();
	image.src=ImgD.src;
	if(image.width>0 && image.height>0){
		ImgD.width=FitWidth;
		ImgD.height=(image.height*FitWidth)/image.width;
		if(ImgD.height > FitHeight)
			ImgD.height = FitHeight;
	} 
}

function ExpandImage1(ImgD,FixedWidth){     //固定图宽，然后后等比例缩放
	var image=new Image();
	image.src=ImgD.src;
	if (image.width < FixedWidth){
		ImgD.width = image.width;
		ImgD.height = image.height;
		return;
	}
	if(image.width>0 && image.height>0){
		ImgD.width=FixedWidth;
		ImgD.height=(image.height*FixedWidth)/image.width;
}
}