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
		if (confirm("정말로 파일을 삭제 하시겠습니까??")) {


			$(".mailbox-attachments").remove();

		}
	})	// $(".mailbox-att..") 종료
})


$("input[type='file']").change(function(){
		
		//첨부 파일 가져오기
		
		//var files=$("input[type='file']");
		
		var files = $("input[name='attachment']")[0].files;
		console.log(files);
		
		// 첨부파일을 formData로 만들어서 전송
		var formData = new FormData();
		for(var i = 0; i < files.length; i++){
			// 확장자 및 크기가 일치하지 않으면 false를 날려 업로드 하지 않음
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}
			formData.append("attachment",files[i]);
		}
		
		$.ajax({
			url:'/uploadAjax',
			type:'post',
			processData:false,
			contentType:false,
			data:formData,
			success:function(result){
					console.log(result);
					showUploadFile(result);
					$("input[name='attachment']").val("");
				},
				error:function(xhr,status,error){
					console.log("에러");
				}
		})
	})	//checkExtension 종료
	
	function showUploadFile(uploadResultArr){
		var str = "";
		// 파일 업로드시 보일 위치
		var uploadResult = $(".help-block");
		
		$(uploadResultArr).each(function(i,obj){
				var fileCallPath = encodeURIComponent(obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName);
					
				str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "'";
				str += " data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'>";
				str += "<a href='/download?fileName=" + fileCallPath + "'>";
				str += "<span>" + obj.fileName + "</span></a>";
				//이미지를 삭제할 수 있는 버튼 생성 및 삭제할 수 있는 정보 담기
				str += "<button type='button' class='btn btn-circle btn-sm' data-file='" + fileCallPath + "' data-type='file'>";
				str += "<i class='fa fa-times'></i></button><br>";		
				str += "</li>";
		})
		uploadResult.append(str);
	} //showUploadFile 종료
	
	//업로드 되는 파일 종류와 크기 제한
	function checkExtension(fileName, fileSize){
		
		// hwp, csv, ppt, img, png, txt, jpg, gif허용
		var regex = new RegExp("(.*?)\.(hwp|xls|csv|pptx|img|png|txt|jpg|gif)");
		
		//파일의 최대 크기 지정
		var maxSize = 10242880;
		
		if(fileSize > maxSize){
			alert("파일 사이즈가 초과되었습니다.")
			return false;
		}
		
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.")
			return false;
		}
		return true;
	}
$(".help-block").on("click","button",function(){
		//목록에 있는 첨부파일 삭제, 서버 폴더 내용 삭제
			
		//파일의 경로 
		var targetFile = $(this).data("file");
		//파일의 타입
		var type = $(this).data("type");
			
		//li 태그 가져오기
		var targetLi = $(this).closest("li");
		//삭제 정보 넘겨주고, li 태그 없애기
		$.ajax({
			url:'/deleteFile',
			type:'post',
			data:{
				fileName:targetFile,
				type:type
			},
			success:function(result){
				console.log(result);
				targetLi.remove();
			}
		})
	})	//uploadResult 종료
	
//submit 버튼 중지
	$("button[type='submit']").click(function(e){
		e.preventDefault();
			
		var str ="";
		$(".help-block li").each(function(idx, obj){
			var job = $(obj);
				
			//수집된 정보를 hidden 태그로 작성
			str += "<input type='hidden' name='attachList[" + idx + "].uuid' value='" + job.data("uuid") + "'>";
			str += "<input type='hidden' name='attachList[" + idx + "].uploadPath' value='" + job.data("path") + "'>";
			str += "<input type='hidden' name='attachList[" + idx + "].fileName' value='" + job.data("filename") + "'>";
			str += "<input type='hidden' name='attachList[" + idx + "].fileType' value='" + job.data("type") + "'>";
				
		})
		console.log(str);
			
		//게시글 등록 폼 가져오기
		var form = $("form[role='form']");
			
		//수집된 내용 폼에 추가하기
		form.append(str);
		
		//폼 전송하기
		form.submit();
			
	})	//button[type...] 종료









