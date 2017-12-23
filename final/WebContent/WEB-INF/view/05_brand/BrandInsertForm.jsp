<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛있당</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/insert/brand.css" />
<script type="text/javascript" src="<%=cp%>/js/insert/textchange.js"></script>
<script type="text/javascript" src="<%=cp%>/js/insert/ajax.js"></script>

<script type="text/javascript">

var num = 1;
var num2 = 1;
var isSubmit = false;


function resetSelect()
{
	$("#brand_big_material").val("");
	$("#brand_unit").val("");
	$("#brand_mass").val("");
	Mate();
}

$( function() 
{
  $( "#sortable" ).sortable();
  $( "#sortable" ).disableSelection();
});


function view(num)
{
	$("#delBtn_"+num).css("display","block");

}

function view2(num)
{
	$("#delBtn_"+num).css("display","none");
}



	$( function() 
	{
	  $( "#sortable2" ).sortable(
		{
			stop : function(event, ui)
			{
				var title = 0;
				
				$("#sortable2 .cont_tit2_1").each(function()
				{
					$(this).html("Step"+ ++title);
				})
			}
		});
	  $( "#sortable2" ).disableSelection();
	});



$(document).ready(function()
{
   $(".numCheck").on("textchange", function()
   {
      if(!/^[0-9]*$/g.test($(this).val()))
      {
         $(this).val($(this).val().slice(0,-1));
         alert("숫자만 입력해주세요.");
      }
         
   });
    
   $("#back").click(function()
   {
      alert("작성을 취소하시겠습니까?");
   });

});

function addMate()
{
	var big_m = document.getElementById("brand_big_material").options;
	var mid_m = document.getElementById("brand_mid_material").options;
	var mass = document.getElementById("brand_mass").value;
	var unit = document.getElementById("brand_unit").options;
	var number = document.getElementsByClassName("addclass").length;
	
	if (number == 0)
	{
		number = num;
	}
	else
	{
		number = num++;
	}
	
	
	if ($("#brand_big_material").val() == '') 
    {
        alert('재료 대분류를 선택해 주세요.');
        $("#brand_big_material").focus();
        return isSubmit = false;
    }
	if ($("#brand_mid_material").val() == '') 
    {
        alert('재료 중분류를 선택해 주세요.');
        $("#brand_mid_material").focus();
        return isSubmit = false;
    }
	if ($.trim($("#brand_mass").val()) == '') 
    {
        alert('재료의 용량을 기입해주세요.');
        $("#brand_mass").focus();
        return isSubmit = false;
    }
	if ($("#brand_unit").val() == '') 
    {
        alert('용량의 단위를 선택해주세요.');
        $("#brand_unit").focus();
        return isSubmit = false;
    }

	var big_m_option = "";
	var mid_m_option = "";
	var unit_option = "";
	
	for(var i = 0 ; i < big_m.length ; i++ )
	{
		if(big_m[i].selected)
			big_m_option = big_m[i].innerHTML;
	}
	
	for(var i = 0 ; i < mid_m.length ; i++ )
	{
		if(mid_m[i].selected)
			mid_m_option = mid_m[i].innerHTML;
	}
	
	for(var i = 0 ; i < unit.length ; i++ )
	{
		if(unit[i].selected)
			unit_option = unit[i].innerHTML;
	}
	
	var result ="";
	
	result = "<div class='addclass' id='mete_"+number+"'><li class='ui-state-default'><span class='btn-lineup addIcon'><sapn class='glyphicon glyphicon-random'></span></span>"
	+ "<input type='text' class='form-control' style='width: 100px;' id='big_"+number+"' name='big' readonly='readonly' value='"+big_m_option+"'>"
	+ "<input type='text' class='form-control' style='width: 150px;' id='mid_"+number+"' name='mid' readonly='readonly' value='"+mid_m_option+"'>"
	+ "<input type='text' class='form-control' style='width: 80px;' id='mass_"+number+"' name='mass' readonly='readonly' value='"+mass+"'>"
	+ "<input type='text' class='form-control' style='width: 80px;' id='unit_"+number+"' name='unit' readonly='readonly' value='"+unit_option+"'>"
			+ "<button type='button' onclick='delMate("+number+")' class='btn btn-default addIcon'><span class='glyphicon glyphicon-remove'></span></button></li></div>";
			
	$("#sortable").append(result);
	resetSelect();
}

function addEmpty()
{
	resetSelect();
	var number = document.getElementsByClassName("addclass").length;
	
	if (number == 0)
	{
		number = num;
	}
	else
	{
		number = num++;
	}
	
	var result ="";

	
	result = "<div class='addclass' id='mete_"+number+"'><li class='ui-state-default'><span class='btn-lineup addIcon'><sapn class='glyphicon glyphicon-random'></span></span>"
		+ "<select style='width: 100px; padding: 0 0 0 0; height: 34px;' id='big_"+number+"' name='bigEmpty'>"
		+ "<option value=''>대분류</option>"
		+ "<c:forEach var='bing' items='${BingList }'>"
		+ "<option value='${bing.big_ing_id }'>${bing.big_ing_name }</option></c:forEach></select>"
		+ "<input class='form-control' style='width: 150px;' id='mid_"+number+"' name='midEmpty'>"
		+ "<input class='form-control numCheck' style='width: 80px;' id='mass_"+number+"' name='massEmpty'>"
		+ "<select style='width: 80px; padding: 0 0 0 0; height: 34px;' id='unit_"+number+"' name='unitEmpty'>"
		+ "<option value=''>단위</option>"
		+ "<c:forEach var='unit' items='${unit }'>"
		+ "<option value='${unit.unit_id }'>${unit.unit_name }</option></c:forEach></select>"
		+ "<button type='button' onclick='delMate("+number+")' class='btn btn-default addIcon'><span class='glyphicon glyphicon-remove'></span></button></li></div>";
		

		
		
		
    $("#sortable").append(result);
   $(".numCheck").on("textchange", function()
   {
     if(!/^[0-9]*$/g.test($(this).val()))
     {
        $(this).val($(this).val().slice(0,-1));
        alert("숫자만 입력해주세요.");
     }
   });
}

function doSubmit(date)
{
    var chkResult = brandInsert(date);
    
    if (!chkResult)
    {
        return isSubmit = false;
    }
    
	var form = document.getElementById("brand_insertForm");
	
	form.action="/99_Dispatcher/brandinsert.action";
	form.submit();
    
}

function brandInsert(date) 
{
	if (date == 'save') 
	{
		if ($.trim($("#brand_title").val()) == '') 
	    {
	        alert('레시피 제목을 입력해 주세요.');
	        $("#brand_title").focus();
	        return isSubmit = false;
	    }
	/* 	
	    if ($("#brand_main_photo").val() == '') 
	    {
	        alert('대표사진을 선택해 주세요.');
	        return isSubmit = false;
	    }
	     */
	    if ($.trim($("#brand_intro").val()) == '') 
	    {
	        alert('요리소개 내용을 입력해 주세요.');
	        $("#brand_intro").focus();
	        return isSubmit = false;
	    }
	    if ($("#brand_category_1").val() == '') 
	    {
	        alert('상황별 카테고리를 선택해 주세요.');
	        $("#brand_category_1").focus();
	        return isSubmit = false;
	    }
	    if ($("#brand_category_2").val() == '') 
	    {
	        alert('조리별 카테고리를 선택해 주세요.');
	        $("#brand_category_2").focus();
	        return isSubmit = false;
	    }
	    if ($("#brand_category_3").val() == '') 
	    {
	        alert('재료별 카테고리를 선택해 주세요.');
	        $("#brand_category_3").focus();
	        return isSubmit = false;
	    }
		if ($("#brand_people").val() == '') 
		{
	       alert('요리인원 선택해 주세요.');
	       $("#brand_people").focus();
	       return isSubmit = false;
	    }
		if ($("#brand_time").val() == '') 
		{
	        alert('요리시간을 선택해 주세요.');
	        $("#brand_time").focus();
	        return isSubmit = false;
	    }
	    if ($("#brand_difficulty").val() == '') 
	    {
	       alert('난이도를 선택해 주세요.');
	       $("#brand_difficulty").focus();
	       return isSubmit = false;
	    }

	}
	return true;
}

function delMate(num)
{
	$("#mete_"+num).remove();
}



function doDelete() 
{
	if (confirm("레시피를 삭제하시겠습니까?")) 
	{
	    isSubmit = true;
	    $("#insFrm [name=q_mode]").val('delete');
	    $("#insFrm").submit();
	}
	else 
	{
	    isSubmit = false;
	}
}

	function file()
	{
		$("#brand_main_file").click();
	}

	function Mate()
	{
		var big = document.getElementById("brand_big_material").value;
		
		// URL 구성
		var url = "/99_Dispatcher/selectbigmaterial.action?big_ing_id="+big;

		// XMLHTTPRequest 객체 생성
		var ajax = createAjax();

		ajax.open("GET", url, true);

		ajax.onreadystatechange = function()
		{

			// alert(ajax.readyState);

			if (ajax.readyState == 4)
			{
				// alert(ajax.status);

				if (ajax.status == 200)
				{
					callBack(ajax);
				}
			}
		}

		ajax.send("");
	}

	// AJAX 요청이 완료된 후 호출되는 최종 함수 (콜백 함수)
	function callBack(ajax)
	{
		var data = ajax.responseXML;
		
		var doc = data.documentElement;
		
		var result = doc.getElementsByTagName("result");
		
		var mSelectHTML = "";
		for(var i = 0 ; i < result.length ; i++)
		{
			mSelectHTML += "<option value='"+result[i].getElementsByTagName("id")[0].firstChild.nodeValue+"'>";
			mSelectHTML += result[i].getElementsByTagName("name")[0].firstChild.nodeValue+"</option>";
		}
		
		if(mSelectHTML =="")
			mSelectHTML +="<option value=''>중분류</option>";
		
		document.getElementById("brand_mid_material").innerHTML = mSelectHTML;
	}

	function addStep()
	{
		var str = "";
		num2++;

		str = "<div id='step_"
				+ num2
				+ "' class='step' onmouseover='view("
				+ num2
				+ ")' onmouseout='view2("
				+ num2
				+ ")'>"
				+ "<p id='stepNum_"+num2+"' class='cont_tit2_1 ui-sortable-handle'>Step"
				+ num2
				+ "</p>"
				+ "<div id='recipe_stepText_"+num2+"'>"
				+ "<textarea name='stepText_"+num2+"' id='stepText_"+num2+"' class='form-control step_cont' placeholder='양파는 사각으로 썰어주세요.'></textarea>"
				+ "</div><div id='stepImg_"+num2+"'><img id='stepImgHolder_"+num2+"'></div>"
				+ "<div style='position: absolute;'><div class='delBtn' id='delBtn_"+num2+"' style='display: none;'>"
				+ "<button type='button' onclick='delStep("
				+ num2
				+ ")' class='btn btn-default addIcon'>"
				+ "<span class='glyphicon glyphicon-remove' ></span></button></div></div>";

		$("#sortable2").append(str);

		$(function(event, ui)
		{
			var title = 0;

			$("#sortable2 .cont_tit2_1").each(function()
			{
				$(this).html("Step" + ++title);
			})
		});
	}

	function delStep(num)
	{
		$("#step_" + num).remove();

		$(function(event, ui)
		{
			var title = 0;

			$("#sortable2 .cont_tit2_1").each(function()
			{
				$(this).html("Step" + ++title);
			})
		});

	}
</script>

</head>
<body>
	<c:import url="../00_main/Menu.jsp"></c:import>

	<form name="brand_insertForm" id="brand_insertForm" method="post">
		<div class="container brand_insert">

			<!-- 레시피 등록 상단부//////////////////////////// -->
			<!-- 제목, 메인사진, 내용, 카테고리, 정보, 재료 -->
			<div class="insert_center">
				<div class="insert_title">브랜드 등록</div>

				<div class="cont_box pad_l_60">

					<!-- 사진등록////////////////////// -->
					<div id="brand_insert_photo_upload" class="cont_pic2">

						<input type="hidden" name="brand_main_photo" id="brand_main_photo"
							value=""> <input type="hidden"
							name="brand_main_photo_new" id="brand_main_photo_new" value="">
						<input type="hidden" name="brand_main_photo_del"
							id="brand_main_photo_del" value="">

						<div class="pic_input">
							<input type="file" name="brand_main_photo" id="brand_main_photo"
								class="brand_main_photo">
						</div>
						<div id="brand_insert_photoBox">
							<img id="brand_insert_photoHolder" onclick="사진추가"
								src="<%=cp%>/images/insert/pic_none3.gif">
						</div>

					</div>

					<div class="cont_line">
						<p class="cont_tit4">레시피 제목</p>
						<input type="text" name="brand_title" id="brand_title"
							class="form-control" placeholder="예) 오져버리는 어머 해장국">
					</div>

					<div class="cont_line pad_b_25">
						<p class="cont_tit4">요리소개</p>
						<textarea id="brand_intro" name="brand_intro"
							class="form-control cont_text"
							placeholder="예) 둘이 먹다 하나 죽어도 모르는 맛."></textarea>
					</div>

					<div class="cont_line">
						<p class="cont_tit4">카테고리</p>
						<select name="brand_category_1" id="brand_category_1">
							<c:forEach var="stu" items="${stu }">
								<option value="${stu.fd_stu_id }">${stu.fd_stu_name }</option>
							
							</c:forEach>
						</select> <select name="brand_category_2" id="brand_category_2">
							<c:forEach var="type" items="${type }">
								<option value="${type.fd_type_id }">${type.fd_type_name }</option>
							
							</c:forEach>
						</select> <select name="brand_category_3" id="brand_category_3">
							<option value="">재료별</option>
							<c:forEach var="ming" items="${MingList }">
								<option value="${ming.mid_ing_id }">${ming.mid_ing_name }</option>
							
							</c:forEach>
						</select> <span class="guide">분류를 바르게 설정하면, 레시피를 검색하기 쉬워집니다.</span>
					</div>

					<div class="cont_line">
						<p class="cont_tit4">요리 정보</p>
						<span class="pad_l_5">인원 </span> <select name="brand_people"
							id="brand_people">
							<c:forEach var="pp" items="${pp }">
								<option value="${pp.pp_id }">${pp.pp_name }</option>
							
							</c:forEach>
						</select> <span class="pad_l_5">시간 </span> <select name="brand_time"
							id="brand_time">
							<c:forEach var="ct" items="${ct }">
								<option value="${ct.ct_id }">${ct.ct_name }</option>
							
							</c:forEach>
						</select> <span class="pad_l_5">난이도 </span> <select name="brand_difficulty"
							id="brand_difficulty">
							<c:forEach var="dif" items="${dif }">
								<option value="${dif.dif_id }">${dif.dif_name }</option>
							
							</c:forEach>
						</select>
					</div>
				</div>

				<!-- 재료 입력 단/////////////////////////////////////// -->
				<div class="cont_box pad_l_60">

					<div class="cont_sel">
						<p class="cont_tit4">요리 재료</p>
						<span class="guide mag_b_15">재료 정보를 최대한 정확히 입력해주세요.</span>
					</div>

					<div class="cont_line">
						<p class="cont_tit4">
							<button type="button" onclick="addEmpty()"
								class="btn btn-default">재료 추가</button>
							<span class="guide2 mag_b_15">찾으시려는 재료가 없으면 직접 추가해보세요.</span>
						</p>
						<select name="brand_big_material" id="brand_big_material" onchange="Mate();">
							<option value="">대분류</option>
							<c:forEach var="bing" items="${BingList }">
								<option value="${bing.big_ing_id }">${bing.big_ing_name }</option>
							</c:forEach>
						</select> <select name="brand_mid_material" id="brand_mid_material">
							<option value="" selected="selected">중분류</option>
						</select> <input class="form-control mass numCheck" name="brand_mass"
							id="brand_mass" placeholder="예) 300"> <select
							name="brand_unit" id="brand_unit">
							<option value="">단위</option>
							<c:forEach var="unit" items="${unit }">
								<option value="${unit.unit_id }">${unit.unit_name }</option>
							
							</c:forEach>
						</select>

						<button type="button" onclick="addMate()"
							class="btn btn-default addIcon"
							style="margin-bottom: 10px;">
							<span class="glyphicon glyphicon-plus"></span>추가
						</button>
					</div>
				</div>

				<div class="cont_box pad_l_60">

					<div class="cont_line">
						<p class="cont_tit4">등록 재료</p>
						<ul id="sortable" class="ui-sortable">

						</ul>

					</div>

				</div>

				<!-- 요리순서 //////////////////////////////////// -->
				<div class="cont_box pad_l_60" style="border-bottom: 0px;">
					<p class="cont_tit4">요리 순서</p>
					<span class="guide mag_b_15">
						<div>요리 순서를 자세히 입력해주세요.</div>
						<div>예) 불을 줄이고 익히세요. ▷ 10분간 중불에 조려주세요.</div>
					</span>

					<div id="sortable2" class="ui-sortable">

						<div id="step_1" class="step" onmouseover="view(1)" onmouseout="view2(1)">
							<p id="stepNum_1" class="cont_tit2_1">Step1</p>
							<div id="recipe_stepText_1">
								<textarea name="stepText" id="stepText_1" style="margin: 0 -4px 0 -3px;" class="form-control step_cont" placeholder="양파는 사각으로 썰어주세요."></textarea>
							</div>
							<div id="stepImg_1">
								<img id="stepImgHolder_1">
							</div>
							<div style="position: absolute;">
								<div class="delBtn" id="delBtn_1" style="display: none;">
									<button type='button' onclick='delStep(1)' class='btn btn-default addIcon'>
									<span class='glyphicon glyphicon-remove' ></span></button>
								</div>
							</div>
						</div>
						
						
					</div>
				</div>
				<!-- 요리 설명 끝//////////////////////////////////// -->

				<div class="btn_add mag_b_25">
					<button type="button" onclick="addStep()" class="btn bnt-default">
						<span class="glyphicon glyphicon-plus-sign"></span>순서 추가
					</button>
				</div>

				<div class="cont_box pad_l_60">
					<p class="cont_tit4">요리 완성 사진</p>

					<div id="complete_picArea" class="ui-sortable">
						<div id="complete_picUpload_1" class="complete_pic">
							<input type="hidden" name="complete_photo[]"
								id="complete_photo_1" value=""> <input type="hidden"
								name="complete_photo_new[]" id="complete_photo_new_1" value="">
							<input type="hidden" name="complete_photo_del[]"
								id="complete_photo_del_1" value="">
							<div id="pic_input">
								<input type="file" name="com_pic_1" id="com_pic_1">
							</div>
							<div id="complete_picBox_1" is_over="0">
								<a href="#" class="pic_del"></a> <img id="com_photoHolder_1"
									onclick="사진업로드" src="<%=cp%>/images/insert/pic_none3.gif"
									alt="No Image">
							</div>
						</div>

						<div id="complete_picUpload_2" class="complete_pic">
							<input type="hidden" name="complete_photo" id="complete_photo_2"
								value=""> <input type="hidden" name="complete_photo_new"
								id="complete_photo_new_2" value=""> <input type="hidden"
								name="complete_photo_del" id="complete_photo_del_2" value="">
							<div id="pic_input">
								<input type="file" name="com_pic_2" id="com_pic_2">
							</div>
							<div id="complete_picBox_2" is_over="0">
								<a href="#" class="pic_del"></a> <img id="com_photoHolder_2"
									onclick="사진업로드" src="<%=cp%>/images/insert/pic_none3.gif"
									alt="No Image">
							</div>
						</div>

						<div id="complete_picUpload_3" class="complete_pic">
							<input type="hidden" name="complete_photo" id="complete_photo_3"
								value=""> <input type="hidden" name="complete_photo_new"
								id="complete_photo_new_3" value=""> <input type="hidden"
								name="complete_photo_del" id="complete_photo_del_3" value="">
							<div id="pic_input">
								<input type="file" name="com_pic_3" id="com_pic_3">
							</div>
							<div id="complete_picBox_3" is_over="0">
								<a href="#" class="pic_del"></a> <img id="com_photoHolder_3"
									onclick="사진업로드" src="<%=cp%>/images/insert/pic_none3.gif"
									alt="No Image">
							</div>
						</div>

						<div id="complete_picUpload_4" class="complete_pic">
							<input type="hidden" name="complete_photo" id="complete_photo_4"
								value=""> <input type="hidden" name="complete_photo_new"
								id="complete_photo_new_4" value=""> <input type="hidden"
								name="complete_photo_del" id="complete_photo_del_4" value="">
							<div id="pic_input">
								<input type="file" name="com_pic_4" id="com_pic_4">
							</div>
							<div id="complete_picBox_4" is_over="0">
								<a href="#" class="pic_del"></a> <img id="com_photoHolder_4"
									onclick="사진업로드" src="<%=cp%>/images/insert/pic_none3.gif"
									alt="No Image">
							</div>
						</div>
					</div>
				</div>
				<!-- 요리순서 끝 -->


				<!-- 브랜드 링크 //////////////////////  -->
				<div class="cont_box pad_l_60">
					<div class="cont_line">
						<p class="cont_tit4">브랜드 링크</p>
						<input type="text" name="brand_link" id="brand_link"
							class="form-control">
					</div>

					<div class="cont_line">
						<p class="cont_tit4">브랜드 사진</p>

						<div id="brand_linkUpload_NUM">

							<input type="hidden" name="linkUpload_no[]"
								id="linkUpload_no_NUM" value=""> <input type="hidden"
								name="linkUpload_photo[]" id="linkUpload_photo_NUM" value="">
							<input type="hidden" name="linkUpload_photo_new[]"
								id="linkUpload_photo_new_NUM" value=""> <input
								type="hidden" name="linkUpload_photo_del[]"
								id="linkUpload_photo_del_NUM" value="">

							<div class="pic_input">
								<input type="file" name="brand_link_file_NUM"
									id="brand_link_file_NUM">
							</div>

							<div id="brand_linkUpload_photoBox_NUM" is_over="0">
								<img id="brand_linkUpload_photoHolder_NUM" onclick="사진파일변경"
									src="<%=cp%>/images/insert/pic_none3.gif">
							</div>

						</div>
					</div>
				</div>

			</div>
			<!-- 인서트센터 끝 -->
		</div>
		<!-- 콘테이너 끝 -->

		<div class="coyo_btn">
			<button type="button" onclick="doSubmit('save')"
				class="btn-lg btn-save">저장</button>
			<button type="button" onclick="history.back();"
				class="btn-lg btn-cancel">취소</button>
		</div>
	</form>
	
	<c:import url="../00_main/Copyright.jsp"></c:import>

</body>
</html>