<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행의 즐거움 :: 떠나!</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css">
    <script src="/resources/js/jquery-3.5.1.min.js"></script>
    <script src="/resources/js/jquery-user.js"></script>
    <script src="/resources/js/jquery-ui.min.js"></script>
    <script src="/resources/js/jquery-migrate-1.4.1.min.js"></script>
    <style>
      .category-check{
        background-color: powderblue;
        color:white;
      }
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
    <div class="main-container">
      <div class="wrapper">
        <div class="write-content">
        
          <div class="post-caption">
            <h2>포스트 수정하기</h2>
          </div>
          <form role="form" id="frm" action="/board/update" method="post" onsubmit="return categoryVal();">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          <input type="hidden" name="bno" value="${board.bno}">
          <!-- 사진 업로드 -->
          <div class="form-main">
              <div class="post-title">
                사진 업로드<span class="icon">*</span>
              </div>
              <div class="post-sub-title">
                여행 특징이 담긴 사진을 업로드해주세요&nbsp;&nbsp;&nbsp;(첫번째사진은 썸네일로 지정).
              </div>
              <div class="photo-upload">
                <input type="file" name='uploadFile' accept="image/gif, image/jpeg, image/png" multiple>
              </div>
              <div class="uploadResult">
	              <ul>
	              </ul>
              </div>
          </div>
          <div class="form-main">
            <div class="post-title">
              제목 추가<span class="icon">*</span>
            </div>
            <div class="main-title title-txt">
              <input type="text" name="title" id="title" placeholder="제목이 포함된 게시글을 작성해보는게 어떨까요?" value="${board.title}">
            </div>
          </div>

          <div class="form-main">
            <div class="post-title">
              내용을 입력해주세요!<span class="icon">*</span>
            </div>
            <div class="main-title content-text">
              <textarea name="content" id="content" placeholder="나만의 여행 스토리를 다른 여행자와 함께 공유해보세요!"><c:out value="${board.content}"/></textarea>
            </div>
          </div>

          <div class="form-main">
            <div class="post-title">
              카테고리<span class="icon">*</span><h4 class="regist-info">최대 3개까지 선택</h4><br><br>
              <hr>
              <span style="font-weight: bold;">기존 카테고리
              <p id="categories"><br><c:forEach var="category" items="${catList}">
	              <c:choose>
	              	<c:when test="${category.catno == 1}">국내여행 </c:when>
	              	<c:when test="${category.catno == 2}">국외여행 </c:when>
	              	<c:when test="${category.catno == 3}">도시여행 </c:when>
	              	<c:when test="${category.catno == 4}">맛집탐방 </c:when>
	              	<c:when test="${category.catno == 5}">데이트코스 </c:when>
	              </c:choose>
              </c:forEach></p></span>
            </div>
            <hr>
            <div class="main-title category-list">
               <span class="category-item" id="category-item1"><input type="hidden" value="1">#국내여행</span>
               <span class="category-item" id="category-item2"><input type="hidden" value="2">#국외여행</span>
               <span class="category-item" id="category-item3"><input type="hidden" value="3">#도시여행</span>
               <span class="category-item" id="category-item4"><input type="hidden" value="4">#맛집탐방</span>
               <span class="category-item" id="category-item5"><input type="hidden" value="5">#데이트코스</span>
            </div>
          </div>

          <div class="form-main">
            <div class="post-title">
              해시태그(최대5개)<br>
              <button type="button" class="btnRemove btn btn_type5">#태그삭제</button>&nbsp;
           	  <button type="button" class="btnAdd btn btn_type5">#태그추가</button>
            </div>
            <div class="main-title hashtag-list">
            </div>
          </div>
          <div class="post-btn-form"> 
            <input class="btn btn_type3 pa-lf-100" type="submit" value="수정">
            <input class="btn btn_type3 pa-lf-100" id="deletePost" value="삭제" style="width: 225px; background-color: #ee3e61;">
            <input class="btn btn_type3 pa-lf-100" value="취소" onclick="history.back();" style="width: 225px; background-color: gray;">
          </div>	
          </form>
          <form action="/board/delete" method="post" id="deleteForm">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          	<input type="hidden" name="bno" value="${board.bno}" />
          </form>
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/includes/sidebar.jsp"></jsp:include>
</body>
<script type="text/javascript">
$(document).ready(function(){
	/*formSubmit*/
	var formObj = $("form[role='form']");
	$("input[type='submit']").on("click",function(e){
		e.preventDefault();
	    console.log("submit clicked");
		var	str = "<input type='hidden' name='attachList[0].thumbnail' value='true'>";
		$(".uploadResult ul li").each(function(i, obj){
			var jobj = $(obj);
			var j;
			j = i+1;
			console.dir("jobj= " + jobj);
		    console.log("-------------------------");
		    console.log('filename= ' + jobj.data("filename"));
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>'";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>'";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>'";
			str += "<input type='hidden' name='attachList["+i+"].ano' value='"+ j +"'>'";
		});
		console.log(str);
		formObj.append(str).submit();
	});
	
	var regex = new RegExp("(.*?\.(exe|sh|zip|alz)$)");
	var maxSize = 5242880;
	
	function checkExtension(filename, filesize){
		if(filesize > maxSize){
			alert("파일 크기 초과");
			return false;
		}
		if(regex.test(filename)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$("input[type='file']").on("change", function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);
 		for(var i=0;i<files.length;i++){
			//	파일 크기 유효성검사
			if(!checkExtension(files[i].name, files[i].size)){
				return;
			}
			formData.append("uploadFile", files[i]);
			formData.append("attachType", false);
		}
		$.ajax({
			url: '/uploadFileAjax',
			processData: false,
			contentType: false,
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			data:formData,
			type: 'POST',
			dataType: 'json',	// JSON 객체 형태로 응답을 받겠다.
			success: function(result){	// result에 JSON 객체 형태로 응답 : List<AttachVO>
				console.log(result);
				showUploadResult(result);	//업로드 결과 처리 함수
			}
		});
	});
	
	function showUploadResult(uploadResultArr){
		if(!uploadResultArr || uploadResultArr.length == 0){
			return;
		}
		var uploadUL = $(".uploadResult ul")
		var str="";
		
		$(uploadResultArr).each(function(i,obj){
				var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"'";
			    str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='image'";
			    str += "><div>";
			    str += "<button type='button' data-file=/'" + fileCallPath + "/' data-type='image' " +
			    	"class='btn btn_type1' style='background-color: #ee3e61;' >X</button><br>";
			    str += "<img src='/display?fileName="+fileCallPath+"'>";
			    str += "</div>";
			    str +"</li>";
		});
		console.dir(str);
		uploadUL.append(str);
	}
	
	(function(){
		
		//	기존 첨부파일
		var bno = '<c:out value="${board.bno}"/>';
		$.getJSON("/board/getAttachList", {bno: bno}, function(arr){
		  console.log(arr);
		  var str = "";
		  $(arr).each(function(i, attach){
		      var fileCallPath =  encodeURIComponent(attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
		      str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' ";
		      str +=" data-filename='"+attach.fileName+"' data-type='image' ><div>";
		      str += "<button type='button' data-file=/'"+fileCallPath+"/' data-type='image' ";
		      str += "class='btn btn_type1' style='background-color: #ee3e61;' >X</button><br>";
		      str += "<img src='/display?fileName="+fileCallPath+"'>";
		      str += "</div>";
		      str +"</li>";
		  });
		  console.dir (str);
		  $(".uploadResult ul").html(str);
		});//end getjson
	})();//end function
	
	
	$(".uploadResult").on("click", "button", function(e){
		console.log("delete file");
		var targetFile = $(this).data("file");
		var targetLi = $(this).closest("li");
		var attachType = false;
		$.ajax({
			url: '/deleteFile',
			data: {fileName: targetFile, type: attachType},
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			dataType:'text',
			type: 'POST',
			success: function(result){
				alert(result);
				targetLi.remove();
			}
		});	//	$.ajax
	});
	
	//	게시글 삭제
	$("#deletePost").on("click",function(e){
		if(confirm('삭제하시겠습니까?')){
		let deleteForm = $("#deleteForm");
		deleteForm.submit();
		}
	});
	
});
	/* add hashTag */
	let tagIndex = '<c:out value="${tagIndex}"/>';
	console.log(tagIndex);

	(function(){
	let bno = '<c:out value="${board.bno}"/>';
		$.getJSON("/board/getTagList", {bno: bno}, function(tagList){
			  var str = "";
			  $(tagList).each(function(i, tag){
			      str += '<input name="tagList['+ i +'].tagName" placeholder="#태그" value="'+ tag.tagName +'" type="text" class="hashtag-item">';
			  });
			  console.dir (str);
			  $('.hashtag-list').html(str);
			});//end getjson
	})();	//	end function

	//  해시태그 삭제
    $('.btnRemove').click(function(){   
      if(!$('.hashtag-list').is(':empty')){
        confirm('삭제하시겠습니까?');
        $('.hashtag-list').empty();  
        tagIndex = 0;      
      }   
    });

	$('.btnAdd').click(function(){
	  console.log('.btnAdd clicked!');
	  //  해시태그 유효성검사(추가버튼 클릭 시)
	  try{
	    $('.hashtag-list input').each(function(i, obj){
	      var jobj = $(obj);
	      console.log('jobj= '+ jobj);
	      var eValid = (/^#[가-힣]{2,8}$/).test(jobj.val());
	      if(!eValid){
	        alert('해시태그는 #로 시작 2~8글자 한글만가능합니다.');
	        jobj.focus();
	        throw 'finish';
	      }        
	    });
	  }catch(Exception){
	    if(Exception !== 'finish'){
	      throw Exception;
	    }else{
	      return false;
	    }
	  }
	
	  console.log('----------------');
	  if(tagIndex < 5){
	    $('.hashtag-list').append(
	      '<input name="tagList['+ tagIndex +'].tagName" placeholder="#태그" type="text" class="hashtag-item">'
	    );  //  input tag 추가
	    tagIndex ++;
	    console.log('tagIndex: ' + tagIndex);
	    return true;
	  }else{
	    alert('5개까지 추가할 수 있습니다.');
	    return false;
	  }
	
	  });
	/* category button change */
	  var categoryValue = "";
	  const tag_array = [1,2,3,4,5];
	  const cat_array = ["","#국내여행","#국외여행","#도시여행","#맛집탐방","#데이트코스"];
	  $("#category-item1").click(function(){
	     $("#category-item1").toggleClass('category-check');
	     categoryValue += $("#category-item1 input").val();
	   });
	   $("#category-item2").click(function(){
	     $("#category-item2").toggleClass('category-check');
	     categoryValue += $("#category-item2 input").val();
	   });
	   $("#category-item3").click(function(){
	     $("#category-item3").toggleClass('category-check');
	     categoryValue += $("#category-item3 input").val();
	   });
	   $("#category-item4").click(function(){
	     $("#category-item4").toggleClass('category-check');
	     categoryValue += $("#category-item4 input").val();
	   });
	   $("#category-item5").click(function(){
	     $("#category-item5").toggleClass('category-check');
	     categoryValue += $("#category-item5 input").val();
	   });

	    function categoryVal(){
	    //  제목, 게시글 유효성검사
	    var title = $("#title").val();
	    var content = $("#content").val();
	  
	     if(title == "" || title == null){
	       alert("제목을 입력해주세요");
	       $("#title").focus();
	       return false;
	     }
	     if(content == "" || content == null){
	       alert("내용을 입력해주세요");
	       $("#content").focus();
	       return false;
	     } 
	  
	     var result = [];
	     console.log(categoryValue);
	     tag_array.forEach(tag => {
	       if(categoryValue.split(tag).length % 2 == 0){
	           result.push(tag) ; 
	         } 
	       }); 
	       console.log(result.length);
	     var str ='';
	     var alertArray = [];
	     var formObj = $("form[role='form']");
	     if(result.length < 4 && result != null){ 
	      for(let i=0;i<result.length;i++){
	        var r = result[i];
	        var j = cat_array[r];
	         str += "<input type='hidden' name='catList["+ i +"].catno' value='"+ r +"' >"  
	         alertArray.push(j);
	       }
	     }
	     // 카테고리 유효성검사
	     if(result.length > 3){
	       alert("카테고리는 최대'3'개 까지 선택가능합니다.");
	       return false; 
	      }else if(result.length == 0 || result == null){
	      alert("카테고리는 최소'1'개이상 선택해야합니다.");
	      return false;
	      }
	     
		 //  해시태그 유효성검사(onSubmit)
	      try{
	        $('.hashtag-list input').each(function(i, obj){
	          var jobj = $(obj);
	          console.log('jobj= '+ jobj);
	          var eValid = (/^#[가-힣]{2,8}$/).test(jobj.val());
	          if(!eValid){
	            alert('해시태그는 #로 시작 2~8글자 한글만가능합니다.');
	            jobj.focus();
	            throw 'finish';
	          }        
	        });
	      }catch(Exception){
	        if(Exception !== 'finish'){
	          throw Exception;
	        }else{
	          return false;
	        }
	      }
	     
	     console.log(str);
	     console.log(alertArray);
	     formObj.append(str);
	     return true;
	   }
</script>
</html>