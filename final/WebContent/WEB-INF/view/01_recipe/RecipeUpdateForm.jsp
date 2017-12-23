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

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/insert/recipe.css" />
<script type="text/javascript" src="<%=cp%>/js/insert/textchange.js"></script>
<script type="text/javascript" src="<%=cp%>/js/insert/ajax.js"></script>

<style type="text/css">

.pic_input
{
	display: inline-block;
	width: 150px;
	height: 150px;
}

</style>


<script type="text/javascript">

var num = 1;
var num2 = 1;
var isSubmit = false;



	function view(num)
	{
		$("#delBtn_"+num).css("display","block");

	}
	
	function view2(num)
	{
		$("#delBtn_"+num).css("display","none");
	}


	function resetSelect()
	{
		$("#recipe_big_material").val("");
		$("#recipe_unit").val("");
		$("#recipe_mass").val("");
		Mate();
	}

	$( function() 
	{
	  $( "#sortable" ).sortable();
	  $( "#sortable" ).disableSelection();
	});

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
	var big_m = document.getElementById("recipe_big_material").options;
	var mid_m = document.getElementById("recipe_mid_material").options;
	var mass = document.getElementById("recipe_mass").value;
	var unit = document.getElementById("recipe_unit").options;
	var number = document.getElementsByClassName("addclass").length;
	
	if (number == 0)
	{
		number = num;
	}
	else
	{
		number = num++;
	}
	
	if ($("#recipe_big_material").val() == '') 
    {
        alert('재료 대분류를 선택해 주세요.');
        $("#recipe_big_material").focus();
        return isSubmit = false;
    }
	if ($("#recipe_mid_material").val() == '') 
    {
        alert('재료 중분류를 선택해 주세요.');
        $("#recipe_mid_material").focus();
        return isSubmit = false;
    }
	if ($.trim($("#recipe_mass").val()) == '') 
    {
        alert('재료의 용량을 기입해주세요.');
        $("#recipe_mass").focus();
        return isSubmit = false;
    }
	if ($("#recipe_unit").val() == '') 
    {
        alert('용량의 단위를 선택해주세요.');
        $("#recipe_unit").focus();
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
			+ "<input type='text' class='form-control' style='width: 100px; background-color:#0000;' id='big_"+number+"' name='big' readonly='readonly' value='"+big_m_option+"'>"
			+ "<input type='text' class='form-control' style='width: 150px; background-color:#0000;' id='mid_"+number+"' name='mid' readonly='readonly' value='"+mid_m_option+"'>"
			+ "<input type='text' class='form-control' style='width: 80px; background-color:#0000;' id='mass_"+number+"' name='mass' readonly='readonly' value='"+mass+"'>"
			+ "<input type='text' class='form-control' style='width: 80px; background-color:#0000;' id='unit_"+number+"' name='unit' readonly='readonly' value='"+unit_option+"'>"
			+ "<button type='button' onclick='delMate("+number+")' class='btn btn-default addIcon'><span class='glyphicon glyphicon-remove'></span></button></li></div>";
			
	$("#sortable").append(result);
	resetSelect();
	
}

function addEmpty()
{
	
	var number = document.getElementsByClassName("addclass").length;
	
	if (number == 0)
	{
		number = num;
	}
	else
	{
		number = num++;
	}
	resetSelect();
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
    var chkResult = recipeInsert(date);
    
    if (!chkResult)
    {
        return isSubmit = false;
    }
    
	var form = document.getElementById("recipe_insertForm");
	
	form.action="/99_Dispatcher/recipeupdate.action";
	
	form.submit();
    
    
}

function recipeInsert(date) 
{
	if (date == 'save') 
	{
		if ($.trim($("#recipe_title").val()) == '') 
	    {
	        alert('레시피 제목을 입력해 주세요.');
	        $("#recipe_title").focus();
	        return isSubmit = false;
	    }
		/* 
	    if ($("#recipe_main_photo").val() == '') 
	    {
	        alert('대표사진을 선택해 주세요.');
	        return isSubmit = false;
	    }
	     */
	    if ($.trim($("#recipe_intro").val()) == '') 
	    {
	        alert('요리소개 내용을 입력해 주세요.');
	        $("#recipe_intro").focus();
	        return isSubmit = false;
	    }
	    if ($("#recipe_category_1").val() == '') 
	    {
	        alert('상황별 카테고리를 선택해 주세요.');
	        $("#recipe_category_1").focus();
	        return isSubmit = false;
	    }
	    if ($("#recipe_category_2").val() == '') 
	    {
	        alert('조리별 카테고리를 선택해 주세요.');
	        $("#recipe_category_2").focus();
	        return isSubmit = false;
	    }
	    if ($("#recipe_category_3").val() == '') 
	    {
	        alert('재료별 카테고리를 선택해 주세요.');
	        $("#recipe_category_3").focus();
	        return isSubmit = false;
	    }
		if ($("#recipe_people").val() == '') 
		{
	       alert('요리인원 선택해 주세요.');
	       $("#recipe_people").focus();
	       return isSubmit = false;
	    }
		if ($("#recipe_time").val() == '') 
		{
	        alert('요리시간을 선택해 주세요.');
	        $("#recipe_time").focus();
	        return isSubmit = false;
	    }
	    if ($("#recipe_difficulty").val() == '') 
	    {
	       alert('난이도를 선택해 주세요.');
	       $("#recipe_difficulty").focus();
	       return isSubmit = false;
	    }
	   

	}
	return true;
}



	function delMate(num)
	{
		$("#mete_"+num).remove();
	}


	function delStep(num)
	{
		$("#step_"+num).remove();
		
		$(function(event, ui)
				{
			var title = 0;
			
			$("#sortable2 .cont_tit2_1").each(function()
			{
				$(this).html("Step"+ ++title);
			})
		});

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
		$("#recipe_main_file").click();
	}
	

	function Mate()
	{
		var big = document.getElementById("recipe_big_material").value;
		
		// URL 구성
		var url = "/99_Dispatcher/selectbigmaterial.action?big_ing_id="+big;

		// XMLHTTPRequest 객체 생성
		var ajax = createAjax();

		ajax.open("GET", url, true);

		ajax.onreadystatechange = function() {

		// alert(ajax.readyState);

			if (ajax.readyState == 4) {
			// alert(ajax.status);

				if (ajax.status == 200) {
					callBack(ajax);
				}
			}
		}

		ajax.send("");
	}

	// AJAX 요청이 완료된 후 호출되는 최종 함수 (콜백 함수)
	function callBack(ajax) {
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
		
		document.getElementById("recipe_mid_material").innerHTML = mSelectHTML;
	}
	
	
	
	
	function addStep()
	{
		var str = "";
		num2++;
			
		str = "<div id='step_"+num2+"' class='step' onmouseover='view("+num2+")' onmouseout='view2("+num2+")'>"
			+ "<p id='stepNum_"+num2+"' class='cont_tit2_1 ui-sortable-handle'>Step"+num2+"</p>"
			+ "<div id='recipe_stepText_"+num2+"'>"
			+ "<textarea name='stepText' id='stepText_"+num2+"' class='form-control step_cont' placeholder='양파는 사각으로 썰어주세요.'></textarea>"
			+ "</div><label for='step_file_"+num2+"'><img id='blah"+num2+"' src='images/AD/photo1.PNG' style='height: 130px; width:130px;'>"
			+ "</label><input type='file' onchange='readURL(this,"+num2+");' name='step_file_"+num2+"' id='step_file_"+num2+"' style='display:none;'/>"
			+ "<div style='position: absolute;'><div class='delBtn' id='delBtn_"+num2+"' style='display: none;'>"
			+ "<button type='button' onclick='delStep("+num2+")' class='btn btn-default addIcon'>"
			+ "<span class='glyphicon glyphicon-remove' ></span></button></div></div></div>";
			
			
		
		$("#sortable2").append(str);
		
		$(function(event, ui)
				{
			var title = 0;
			
			$("#sortable2 .cont_tit2_1").each(function()
			{
				$(this).html("Step"+ ++title);
			})
		});
		
	}
	
	function readURL(input,num) {
		if (input.files && input.files[0])
		{
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah'+num).attr('src', e.target.result);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
	
	
	
</script>

</head>
<body>

	<c:import url="../00_main/Menu.jsp" />

	<form name="recipe_insertForm" id="recipe_insertForm" method="post">
		<div class="container recipe_insert" style="margin-top: 3%;">
		
		<input type="hidden" value="${r_id }" id="r_id" name="r_id">

			<!-- 레시피 등록 상단부//////////////////////////// -->
			<!-- 제목, 메인사진, 내용, 카테고리, 정보, 재료 -->
			<div class="insert_center">
				<div class="insert_title">레시피 등록</div>

				<div class="cont_box pad_l_60">

					<!-- 사진등록////////////////////// -->
					<div id="recipe_insert_photo_upload" class="cont_pic2">
					
					<script type="text/javascript">
							function readURLa(input) {
								if (input.files && input.files[0])
								{
									var reader = new FileReader();
						
									reader.onload = function(e) {
										$('#blaha').attr('src', e.target.result);
									};
						
									reader.readAsDataURL(input.files[0]);
								}
							}
						</script>

						<div class="pic_input">
							<label for="recipe_main_file"> <img id="blaha"
								src="${main.r_main_img }">
							</label> <input type='file' onchange="readURLa(this);" name="recipe_main_file"
								id="recipe_main_file" class="recipe_main_photo" style="display: none;" value="${main.r_main_img }"/>
						</div>

					</div>

					<div class="cont_line">
						<p class="cont_tit4">레시피 제목</p>
						<input type="text" name="recipe_title" id="recipe_title"
							class="form-control" placeholder="예) 오져버리는 어머 해장국"
							value="${main.r_title }">
					</div>

					<div class="cont_line pad_b_25">
						<p class="cont_tit4">요리소개</p>
						<textarea id="recipe_intro" name="recipe_intro"
							class="form-control cont_text"
							placeholder="예) 둘이 먹다 하나 죽어도 모르는 맛." >${main.r_content }</textarea>
					</div>

					<div class="cont_line">
						<p class="cont_tit4">카테고리</p>
						<select name="recipe_category_1" id="recipe_category_1">
							<c:forEach var="stu" items="${stu }">
								<c:if test="${main.fd_stu_id==stu.fd_stu_id }">
									<option value="${stu.fd_stu_id }" selected="selected">${stu.fd_stu_name }</option>
								</c:if>
								<c:if test="${main.fd_stu_id!=stu.fd_stu_id }">
									<option value="${stu.fd_stu_id }">${stu.fd_stu_name }</option>
								</c:if>
							</c:forEach>
						</select> <select name="recipe_category_2" id="recipe_category_2">
							<c:forEach var="type" items="${type }">
								<c:if test="${main.fd_type_id==type.fd_type_id }">
								<option value="${type.fd_type_id }" selected="selected">${type.fd_type_name }</option>
								</c:if>
								<c:if test="${main.fd_type_id!=type.fd_type_id }">
								<option value="${type.fd_type_id }">${type.fd_type_name }</option>
								</c:if>
							</c:forEach>
						</select> <select name="recipe_category_3" id="recipe_category_3">
							<option value="">재료별</option>
							<c:forEach var="ming" items="${MingList }">
								<c:if test="${main.mid_ing_id==ming.mid_ing_id }">
								<option value="${ming.mid_ing_id }" selected="selected">${ming.mid_ing_name }</option>
								</c:if>
								<c:if test="${main.mid_ing_id!=ming.mid_ing_id }">
								<option value="${ming.mid_ing_id }">${ming.mid_ing_name }</option>
								</c:if>
							</c:forEach>
						</select> <span class="guide">분류를 바르게 설정하면, 레시피를 검색하기 쉬워집니다.</span>
					</div>

					<div class="cont_line">
						<p class="cont_tit4">요리 정보</p>
						<span class="pad_l_5">인원 </span> <select name="recipe_people"
							id="recipe_people">
							<c:forEach var="pp" items="${pp }">
								<c:if test="${main.pp_id == pp.pp_id }">
								<option value="${pp.pp_id }" selected="selected">${pp.pp_name }</option>
								</c:if>
								<c:if test="${main.pp_id != pp.pp_id }">
								<option value="${pp.pp_id }">${pp.pp_name }</option>
								</c:if>
							</c:forEach>
						</select> <span class="pad_l_5">시간 </span> <select name="recipe_time"
							id="recipe_time">
							<c:forEach var="ct" items="${ct }">
								<c:if test="${main.ct_id == ct.ct_id }">
								<option value="${ct.ct_id }" selected="selected">${ct.ct_name }</option>
								</c:if>
								<c:if test="${main.ct_id != ct.ct_id }">
								<option value="${ct.ct_id }">${ct.ct_name }</option>
								</c:if>
							
							</c:forEach>
						</select> <span class="pad_l_5">난이도 </span> <select
							name="recipe_difficulty" id="recipe_difficulty">
							<c:forEach var="dif" items="${dif }">
								<c:if test="${main.dif_id == dif.dif_id }">
								<option value="${dif.dif_id }" selected="selected">${dif.dif_name }</option>
								</c:if>
								<c:if test="${main.dif_id != dif.dif_id }">
								<option value="${dif.dif_id }">${dif.dif_name }</option>
								</c:if>
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

						<select name="recipe_big_material" id="recipe_big_material" onchange="Mate();">
							<option value="">대분류</option>
							<c:forEach var="bing" items="${BingList }">
								<option value="${bing.big_ing_id }">${bing.big_ing_name }</option>
							</c:forEach>
						</select> 
						<select name="recipe_mid_material" id="recipe_mid_material">
							<option value="" selected="selected">중분류</option>
						</select> 
							<input class="form-control mass numCheck" name="recipe_mass"
							id="recipe_mass" placeholder="예) 300"> <select
							name="recipe_unit" id="recipe_unit">
							<option value="">단위</option>
							<c:forEach var="unit" items="${unit }">
								<option value="${unit.unit_id }">${unit.unit_name }</option>
							
							</c:forEach>
						</select>

						<button type="button" onclick="addMate()"
							class="btn btn-default addIcon btn_add"
							style="margin-bottom: 15px;">
							<span class="glyphicon glyphicon-plus"></span>추가
						</button>
					</div>

				</div>

				<div class="cont_box pad_l_60">

					<div class="cont_line">
						<p class="cont_tit4">등록 재료</p>
						<ul id="sortable" class="ui-sortable">
						<c:forEach var="mate" items="${mate }" varStatus="status">
						<div class='addclass' id='mete_${status.count }'><li class='ui-state-default'><span class='btn-lineup addIcon'><sapn class='glyphicon glyphicon-random'></span></span>
						<input type='text' class='form-control' style='width: 100px; background-color: #0000;' id='big_${status.count }' name='big' readonly='readonly' value='${mate.big_ing_name }'>
						<input type='text' class='form-control' style='width: 150px; background-color: #0000;' id='mid_${status.count }' name='mid' readonly='readonly' value='${mate.mid_ing_name }'>
						<input type='text' class='form-control' style='width: 80px; background-color: #0000;' id='mass_${status.count }' name='mass' readonly='readonly' value='${mate.r_ing_weight }'>
						<input type='text' class='form-control' style='width: 80px; background-color: #0000;' id='unit_${status.count }' name='unit' readonly='readonly' value='${mate.unit_name }'>
						<button type='button' onclick='delMate("${status.count }")' class='btn btn-default addIcon'><span class='glyphicon glyphicon-remove'></span></button></li></div>
						</c:forEach>
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
					<c:forEach var="step" items="${step }" varStatus="status">
						<div id="step_${status.count }" class="step" onmouseover="view(${status.count })" onmouseout="view2(${status.count })">
							<p id="stepNum_${status.count }" class="cont_tit2_1">Step${status.count }</p>
							<div id="recipe_stepText_${status.count }">
								<textarea name="stepText" id="stepText_${status.count }" style="margin: 0 -4px 0 -3px;" class="form-control step_cont" placeholder="양파는 사각으로 썰어주세요.">${step.r_step_content }</textarea>
							</div>
							
							<div class="stepImg_${status.count }">
								<label for="step_file_${status.count }"> 
								<img id="blah${status.count }"	src="${step.r_step_img }" style="height: 130px; width: 130px;">
								</label>
								<input type='file' onchange="readURL(this,${status.count });" name="step_file_${status.count }"
									id="step_file_${status.count }" style="display: none;" />
							</div>
							
							<div style="position: absolute;">
								<div class="delBtn" id="delBtn_${status.count }" style="display: none;">
									<button type='button' onclick='delStep(${status.count })' class='btn btn-default addIcon'>
									<span class='glyphicon glyphicon-remove' ></span></button>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
					
				</div>
				
				
					<div class="btn_add mag_b_25">
						<button type="button" onclick="addStep()" class="btn bnt-default">
							<span class="glyphicon glyphicon-plus"></span>순서 추가
						</button>
					</div>


					
				
				<!-- 요리 설명 끝//////////////////////////////////// -->

				<div class="cont_box pad_l_60">
					<p class="cont_tit4">요리 완성 사진</p>
					
					<script type="text/javascript">
						function cl1(input) {
							if (input.files && input.files[0])
							{
								var reader = new FileReader();
					
								reader.onload = function(e) {
									$('#cl1').attr('src', e.target.result);
								};
					
								reader.readAsDataURL(input.files[0]);
							}
						}
						function cl2(input) {
							if (input.files && input.files[0])
							{
								var reader = new FileReader();
					
								reader.onload = function(e) {
									$('#cl2').attr('src', e.target.result);
								};
					
								reader.readAsDataURL(input.files[0]);
							}
						}
						function cl3(input) {
							if (input.files && input.files[0])
							{
								var reader = new FileReader();
					
								reader.onload = function(e) {
									$('#cl3').attr('src', e.target.result);
								};
					
								reader.readAsDataURL(input.files[0]);
							}
						}
						function cl4(input) {
							if (input.files && input.files[0])
							{
								var reader = new FileReader();
					
								reader.onload = function(e) {
									$('#cl4').attr('src', e.target.result);
								};
					
								reader.readAsDataURL(input.files[0]);
							}
						}
					</script>

					<div id="complete_picArea" class="ui-sortable">
						<c:forEach var="cl" items="${cl }" varStatus="status">
						
						<div id="complete_picUpload_${status.count }" class="complete_pic">
							<div id="pic_input">
								<label for="com_pic_${status.count }"> <img id="cl${status.count }"
									src="${cl.r_cl_img }">
								</label>
								<input type='file' onchange="cl${status.count }(this);" name="com_pic_${status.count }"
									id="com_pic_${status.count }" style="display: none;" />
							</div>
						</div>
						
						</c:forEach>
					</div>
				</div>
				<!-- 요리순서 끝 -->

				<!-- 태그////////////////////// -->
				<div class="cont_box pad_l_60">
					<div class="cont_line">
						<p class="cont_tit4">태그</p>
						<input type="text" name="tag_txet" id="recipe_tags" value="${main.r_tag }"
							class="form-control"> <span class="tag_span"> 검색에
							추가할 단어를 태그로 남겨주세요. <em class="tag_em">예) #연인 #감기 #닭고기 #초간단
								#자취</em>
						</span>
					</div>
				</div>
				<!-- 태그 끝 -->

			</div>
			<!-- 인서트 센터 끝 -->
		</div>
		<!-- 콘테이너 끝 -->
		<div class="coyo_btn">
			<button type="button" onclick="doSubmit('save')"
				class="btn-lg btn-save">저장</button>
			<button type="button" onclick="history.back();" id="back"
				class="btn-lg btn-cancel">취소</button>
		</div>
	</form>

	<!-- Site footer -->
	<footer class="footer">
		<c:import url="../00_main/Copyright.jsp"></c:import>
	</footer>

</body>
</html>