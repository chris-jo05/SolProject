/**
 *  첨부파일 읽어 오기
 */

$(function(){
	
	// 첨부파일 가져오기
	$.getJSON({
		url:'getAttachList',
		data:{
			bno:bno
		},
		success:function(data){
			console.log(data);
			
			var str = "";
			$(data).each(function(i,obj){
				str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "'";
				str += " data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'>";
				str += "<span class='mailbox-attachment-icon'><i class='far fa-file-pdf'></i></span>"
				str += "<div class='mailbox-attachment-info text-center'><i class='fas fa-paperclip'></i>" + obj.fileName + "</div>";
				str += "</li>";
			})	//$(data).each 종료
			$(".mailbox-attachments").html(str);
		} // success 종료
	})	// getJSON 종료
	
	$(".mailbox-attachments").on("click","li",function(){
		var liObj = $(this);
		
		var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
		
		self.location = "/download?fileName=" + path;
	})	// $(".mailbox-att..") 종료
})