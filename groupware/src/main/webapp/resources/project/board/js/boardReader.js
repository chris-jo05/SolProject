$(function(){
   
   // 첨부 파일 가져오기
   $.getJSON({
      url:'getAttachList',
      data:{
         bno:bno
      },
      success:function(data){
         console.log(data);

		var str="";
		$(data).each(function(i,obj){
		 if(obj.fileType) { //image
            var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
            
         
            str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
            str+="data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
            str+="<img src='/display?fileName="+fileCallPath+"'>";
            str+="</li>";            
         }else {            
            str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
            str+="data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
            str+="<span>"+obj.fileName+"</span><br>";
            str+="<img src='/resources/img/attach.png'>";
            str+="</li>";
         }
			
		})
		$(".uploadResult ul").html(str);
      }
   })//getJSON종료
   
	
	$(".uploadResult").on("click","li",function(){
		var liObj = $(this);
		
		var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
		
		if(liObj.data("type")){
			showImage(path.replace(new RegExp(/\\/g),"/"));
		}else{
			self.location="/download1?fileName="+path;
		}
	})
})