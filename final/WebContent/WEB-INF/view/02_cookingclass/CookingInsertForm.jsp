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
<title>CookingInsertForm.jsp</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">



<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/insert/textchange.js"></script>
<script type="text/javascript" src="<%=cp%>/js/insert/ajax.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/cook/cooking.css" />


<script>

  $( function() {
    $( "#datepicker" ).datepicker({
      showOn: "button",
      buttonImage: "images/cook/cal.png",
      dayNamesMin:['일','월','화','수','목','금','토'],
      dateFormat:'yy-mm-dd',
      changeMonth:true,
      changeYear:true,
      showMonthAfterYear:true,
      minDate: "Today",
      maxDate: "Today"+180,
      buttonImageOnly: true,
      buttonText: "Select date"
   
    });
  } );

  $( function() {
    $( "#datepicker2" ).datepicker({
      showOn: "button",
      buttonImage: "images/cook/cal.png",
      dayNamesMin:['일','월','화','수','목','금','토'],
      dateFormat:'yy-mm-dd',
      changeMonth:true,
      changeYear:true,
      showMonthAfterYear:true,
      minDate: "Today",
      maxDate: "Today"+180,
      buttonImageOnly: true,
      buttonText: "Select date"
      
    });
  } );
 
  $( function() {
	    $( "#datepicker3" ).datepicker({
	      showOn: "button",
	      buttonImage: "images/cook/cal.png",
	      dayNamesMin:['일','월','화','수','목','금','토'],
	      dateFormat:'yy-mm-dd',
	      changeMonth:true,
	      changeYear:true,
	      showMonthAfterYear:true,
	      minDate: "Today",
	      maxDate: "Today"+180,
	      buttonImageOnly: true,
	      buttonText: "Select date"
	    });
	  } );
  


  var num = 1;
  var num3 = 1;
  var isSubmit = false;

  	

 	
 	
	
	function resetSelect()
	{
		$("#cooking_big_material").val("");
		$("#cooking_unit").val("");
		$("#cooking_mass").val("");
		$("#cooking_price").val("");
		Mate();
	}
	
	function resetSelect2()
	{
		$("#cooking_start_time").val("");
		$("#cooking_start_hour").val("");
		$("#cooking_start_min").val("");
		$("#datepicker3").val("");
		$("#cooking_end_time").val("");
		$("#cooking_end_hour").val("");
		$("#cooking_end_min").val("");
	}
 	

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

	


  $( function() 
  {
    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
  });



  function addTime()
  {
	var date = document.getElementById("datepicker3").value;
  	var startTime = document.getElementById("cooking_start_time").options;
  	var startHour = document.getElementById("cooking_start_hour").options;
  	var startMin = document.getElementById("cooking_start_min").options;
  	var endTime = document.getElementById("cooking_end_time").options;
  	var endHour = document.getElementById("cooking_end_hour").options;
  	var endMin = document.getElementById("cooking_end_min").options;
  	var number = document.getElementsByClassName("addTime").length;
  	
  	if (number == 0)
  	{
  		number = num3;
  	}
  	else
  	{
  		number = num3++;
  	}
  	
  	if ($("#datepicker3").val() == '') 
    {
        alert('강의 시작 날짜를 설정해주세요.');
        $("#datepicker3").focus();
        return isSubmit = false;
    }
  	
  	if ($("#cooking_start_time").val() == '') 
      {
          alert('강의 시작 시간(오전/오후)을(를) 설정해주세요.');
          $("#cooking_start_time").focus();
          return isSubmit = false;
      }
  	if ($("#cooking_start_hour").val() == '') 
      {
          alert('강의 시작 시 를 설정해주세요.');
          $("#cooking_start_hour").focus();
          return isSubmit = false;
      }
  	if ($("#cooking_start_min").val() == '') 
      {
          alert('강의 시작 분 을 설정해주세요.');
          $("#cooking_start_min").focus();
          return isSubmit = false;
      }
  	if ($("#cooking_end_time").val() == '') 
      {
          alert('강의 종료 시간(오전/오후)을(를) 설정해주세요.');
          $("#cooking_end_time").focus();
          return isSubmit = false;
      }
  	if ($("#cooking_end_hour").val() == '') 
    {
        alert('강의 종료 시 를 설정해주세요.');
        $("#cooking_end_hour").focus();
        return isSubmit = false;
    }
  	if ($("#cooking_end_min").val() == '') 
    {
        alert('강의 종료 분 을 설정해주세요.');
        $("#cooking_end_min").focus();
        return isSubmit = false;
    }

  	var CSToption = "";
  	var CSHoption = "";
  	var CSMoption = "";
  	var CEToption = "";
  	var CEHoption = "";
  	var CEMoption = "";
  	
  	for(var i = 0 ; i < startTime.length ; i++ )
  	{
  		if(startTime[i].selected)
  			CSToption = startTime[i].innerHTML;
  	}
  	
  	for(var i = 0 ; i < startHour.length ; i++ )
  	{
  		if(startHour[i].selected)
  			CSHoption = startHour[i].innerHTML;
  	}
  	
  	for(var i = 0 ; i < startMin.length ; i++ )
  	{
  		if(startMin[i].selected)
  			CSMoption = startMin[i].innerHTML;
  	}
  	
  	for(var i = 0 ; i < endTime.length ; i++ )
  	{
  		if(endTime[i].selected)
  			CEToption = endTime[i].innerHTML;
  	}
  	
  	for(var i = 0 ; i < endHour.length ; i++ )
  	{
  		if(endHour[i].selected)
  			CEHoption = endHour[i].innerHTML;
  	}
  	
  	for(var i = 0 ; i < endMin.length ; i++ )
  	{
  		if(endMin[i].selected)
  			CEMoption = endMin[i].innerHTML;
  	}
  	
  	var result ="";
  	
  	result = "<div class='addTime' id='time_"+number+"'>"
  			+ "<span class='setFont'>"+number+" 회차</span>"
  			+ "<input type='text' class='form-control' style='width:100px;' id='menu_"+number+"' name='menu'>"
  			+ "<input type='text' class='form-control' style='width:100px;' id='date_"+number+"' readonly='readonly' name='date' value='"+date+"'>"
  			+ "<input type='text' class='form-control' style='width:60px;' id='CST_"+number+"' readonly='readonly' name='CST' value='"+CSToption+"'>"
  			+ "<input type='text' class='form-control' style='width:60px;' id='CSH_"+number+"' readonly='readonly' name='CSH' value='"+CSHoption+"'>"
  			+ "<input type='text' class='form-control' style='width:60px;' id='CSM_"+number+"' readonly='readonly' name='CSM' value='"+CSMoption+"'>"
  			+ "<input type='text' class='form-control' style='width:60px;' id='CET_"+number+"' readonly='readonly' name='CET' value='"+CEToption+"'>"
  			+ "<input type='text' class='form-control' style='width:60px;' id='CEH_"+number+"' readonly='readonly' name='CEH' value='"+CEHoption+"'>"
  			+ "<input type='text' class='form-control' style='width:60px;' id='CEM_"+number+"' readonly='readonly' name='CEM' value='"+CEMoption+"'>"
  			+ "<button type='button' onclick='delTime("+number+")' class='btn btn-default addIcon'><span class='glyphicon glyphicon-remove'></span></button></div>";
  			
  			
  			 
  	$("#timeTable").append(result);
  	resetSelect2();
  }




  function doSubmit(date)
  {
      var chkResult = cookingInsert(date);
      
      if (!chkResult)
      {
          return isSubmit = false;
      }

 
	  	var form = document.getElementById("cooking_insertForm");
	  	
	  	form.action="/YSH/cookinginsert.action";
	  	
	  	form.submit();
      
  }


  function cookingInsert(date) 
  {
  	if (date == 'save') 
  	{
  		if ($.trim($("#cooking_title").val()) == '') 
  	    {
  	        alert('레시피 제목을 입력해 주세요.');
  	        $("#cooking_title").focus();
  	        return isSubmit = false;
  	    }
  		/* 
  	    if ($("#cooking_main_photo").val() == '') 
  	    {
  	        alert('대표사진을 선택해 주세요.');
  	        return isSubmit = false;
  	    }
  	     */
  	    if ($.trim($("#cooking_intro").val()) == '') 
  	    {
  	        alert('요리소개 내용을 입력해 주세요.');
  	        $("#cooking_intro").focus();
  	        return isSubmit = false;
  	    }
  	    if ($("#cooking_category_1").val() == '') 
  	    {
  	        alert('대분류 카테고리를 선택해 주세요.');
  	        $("#cooking_category_1").focus();
  	        return isSubmit = false;
  	    }
  	    if ($("#cooking_category_2").val() == '') 
  	    {
  	        alert('중분류 카테고리를 선택해 주세요.');
  	        $("#cooking_category_2").focus();
  	        return isSubmit = false;
  	    }
  	    if ($("#cooking_category_3").val() == '') 
  	    {
  	        alert('소분류 카테고리를 선택해 주세요.');
  	        $("#cooking_category_3").focus();
  	        return isSubmit = false;
  	    }
  	 	if ($("#class_intro").val() == '') 
		{
	        alert('강의 소개를 입력해주세요.');
	        $("#class_intro").focus();
	        return isSubmit = false;
	    }
  		if ($("#cooking_people").val() == '') 
  		{
  	       alert('요리인원 선택해 주세요.');
  	       $("#cooking_people").focus();
  	       return isSubmit = false;
  	    }
  		if ($("#cooking_time").val() == '') 
  		{
  	        alert('요리시간을 선택해 주세요.');
  	        $("#cooking_time").focus();
  	        return isSubmit = false;
  	    }
  	    if ($("#cooking_difficulty").val() == '') 
  	    {
  	       alert('난이도를 선택해 주세요.');
  	       $("#cooking_difficulty").focus();
  	       return isSubmit = false;
  	    }cooking_mozip
  	    
  	 	if ($.trim($("#cooking_mozip").val()) == '') 
	    {
	        alert('모집 인원 입력해 주세요.');
	        $("#cooking_mozip").focus();
	        return isSubmit = false;
	    }

  	}
  	return true;
  }



  function delTime(num)
  {
  	$("#time_"+num).remove();
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
  		$("#cooking_main_file").click();
  	}
 
  	function Mate()
  	{
  		var big = document.getElementById("cooking_big_material").value;
  		
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
		
		document.getElementById("cooking_mid_material").innerHTML = mSelectHTML;
	}
	
	
	
	function addMate()
	{
		var big_m = document.getElementById("cooking_big_material").options;
		var mid_m = document.getElementById("cooking_mid_material").options;
		var mass = document.getElementById("cooking_mass").value;
		var unit = document.getElementById("cooking_unit").options;
		var number = document.getElementsByClassName("addclass").length;
		var price = document.getElementById("cooking_price").value;
		
		if (number == 0)
		{
			number = num;
		}
		else
		{
			number = num++;
		}
		
		
		if ($("#cooking_big_material").val() == '') 
	    {
	        alert('재료 대분류를 선택해 주세요.');
	        $("#cooking_big_material").focus();
	        return isSubmit = false;
	    }
		if ($("#cooking_mid_material").val() == '') 
	    {
	        alert('재료 중분류를 선택해 주세요.');
	        $("#cooking_mid_material").focus();
	        return isSubmit = false;
	    }
		if ($.trim($("#cooking_mass").val()) == '') 
	    {
	        alert('재료의 용량을 기입해주세요.');
	        $("#cooking_mass").focus();
	        return isSubmit = false;
	    }
		if ($("#cooking_unit").val() == '') 
	    {
	        alert('용량의 단위를 선택해주세요.');
	        $("#cooking_unit").focus();
	        return isSubmit = false;
	    }
		
		if ($.trim($("#cooking_price").val()) == '') 
	    {
	        alert('재료의 가격을 기입해주세요.');
	        $("#cooking_price").focus();
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
		
		result = "<div class='addclass' id='mete_"+number+"'><li class='ui-state-default dell'><span class='btn-lineup addIcon'><sapn class='glyphicon glyphicon-random'></span></span>"
				+ "<input type='text' class='form-control' style='width: 100px;' id='big_"+number+"' name='big' readonly='readonly' value='"+big_m_option+"'>"
				+ "<input type='text' class='form-control' style='width: 150px;' id='mid_"+number+"' name='mid' readonly='readonly' value='"+mid_m_option+"'>"
				+ "<input type='text' class='form-control' style='width: 80px;' id='mass_"+number+"' name='mass' readonly='readonly' value='"+mass+"'>"
				+ "<input type='text' class='form-control' style='width: 80px;' id='unit_"+number+"' name='unit' readonly='readonly' value='"+unit_option+"'>"
				+ "<input type='text' class='form-control' style='width: 85px;' id='price_"+number+"' name='price' readonly='readonly' value='"+price+"'>"
				+ "<span class='setFont'>원</span>"
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
		
		result = "<div class='addclass' id='mete_"+number+"'><li class='ui-state-default backcolor'><span class='btn-lineup addIcon'><sapn class='glyphicon glyphicon-random'></span></span>"
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
		+ "<input class='form-control numCheck' style='width: 85px;' id='price_"+number+"' name='priceEmpty'>"
		+ "<span class='setFont'>원</span>"
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
	
	
	
	function addMoney()
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
		
		var result ="";
		
		result = "<div class='addclass' id='money_"+number+"'><li class='ui-state-default dell'><span class='btn-lineup addIcon'><sapn class='glyphicon glyphicon-random'></span></span>"
			+ "<input class='form-control' style='width: 150px;' id='mt_"+number+"' name='mt'>"
			+ "<input class='form-control numCheck' style='width: 100px;' id='mp_"+number+"' name='mp'>"
			+ "<span class='setFont'>원</span>"
			+ "<button type='button' onclick='delMoney("+number+")' class='btn btn-default addIcon'><span class='glyphicon glyphicon-remove'></span></button></li></div>";
			
		
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
	
	function delMoney(num)
	{
		$("#money_"+num).remove();
	}
	
	
</script>



</head>
<body>
	 <c:import url="../00_main/Menu.jsp"></c:import>

	<form name="cooking_insertForm" id="cooking_insertForm" method="post">

		<div class="container cooking_insert" style="margin-top: 3%;">

			<div class="insert_center">
				<div class="insert_title">쿠킹클래스 모집</div>

				<div class="cont_box pad_l_60">
					<div id="cooking_insert_photo_upload" class="cont_pic2">

						<input type="hidden" name="cooking_main_photo"
							id="cooking_main_photo" value=""> <input type="hidden"
							name="cooking_main_photo_new" id="cooking_main_photo_new"
							value=""> <input type="hidden"
							name="cooking_main_photo_del" id="cooking_main_photo_del"
							value="">

						<div class="pic_input">
							<input type="file" name="cooking_main_photo"
								id="cooking_main_photo" class="cooking_main_photo">
						</div>
						<div id="cooking_insert_photoBox">
							<img id="cooking_insert_photoHolder" onclick="사진추가"
								src="<%=cp%>/images/cook/pic.gif">
						</div>

					</div>

					<div class="cont_line">
						<p class="cont_tit4">클래스 제목</p>
						<input type="text" name="cooking_title" id="cooking_title"
							class="form-control" placeholder="예) 상모 사람 만들기">
					</div>

					<div class="cont_line pad_b_25">
						<p class="cont_tit4">클래스 소개</p>
						<textarea id="class_intro" name="class_intro"
							class="form-control cont_text"
							placeholder="예) 상모를 사람으로 만들기 위해 필요한 모든 정보가 담긴 강의 입니다."></textarea>
					</div>

					<div class="cont_line">

						<p class="cont_tit4">카테고리</p>
						<select name="cooking_category_1" id="cooking_category_1">
							<option value="">대분류</option>
							<c:forEach var="bc" items="${bc }">
								<option value="${bc.big_ck_id }">${bc.big_ck_name }</option>
							
							</c:forEach>
						</select> <select name="cooking_category_2" id="cooking_category_2">
							<option value="">중분류</option>
							<c:forEach var="mc" items="${mc }">
								<option value="${mc.mid_ck_id }">${mc.mid_ck_name }</option>
							
							</c:forEach>
						</select> <select name="cooking_category_3" id="cooking_category_3">
							<option value="">소분류</option>
							<c:forEach var="sc" items="${sc }">
								<option value="${sc.sma_ck_id }">${sc.sma_ck_name }</option>
							
							</c:forEach>
						</select>

						<div class="cont_line">
							<p class="cont_tit4">요리 제목</p>
							<input type="text" name="cooking_subTitle" id="cooking_subTitle"
								class="form-control" placeholder="예) 보고보고 또 버거">
						</div>

						<div class="cont_line">
							<p class="cont_tit4">요리 정보</p>
							<span class="pad_l_15">인원 </span> <select name="cooking_people"
								id="cooking_people">
							<c:forEach var="pp" items="${pp }">
								<option value="${pp.pp_id }">${pp.pp_name }</option>
							
							</c:forEach>
							</select> <span class="pad_l_15">시간 </span> <select name="cooking_time"
								id="cooking_time">
								<c:forEach var="ct" items="${ct }">
								<option value="${ct.ct_id }">${ct.ct_name }</option>
							
							</c:forEach>
							</select> <span class="pad_l_15">난이도 </span> <select
								name="cooking_difficulty" id="cooking_difficulty">
								<c:forEach var="dif" items="${dif }">
								<option value="${dif.dif_id }">${dif.dif_name }</option>
							
							</c:forEach>
							</select>
							
							<span class="pad_l_15">모집 인원 </span>
							<input type="text" class="form-control numCheck" style="width: 85px; height: 47px; padding-bottom: 2px;"
							 name="cooking_mozip" id="cooking_mozip">
						</div>
						
						<div class="cont_line">
							<p class="cont_tit4">신청 기간</p>
							<input type="text" id="datepicker" name="cooking_start"
								class="form-control form-control-date datepicker" readonly="readonly"> ~ <input
								type="text" id="datepicker2" name="cooking_end"
								class="form-control form-control-date datepicker" readonly="readonly">
						</div>
					</div>
				</div>



				<div class="cont_box pad_l_60">

					<div class="cont_line" style="width: 900px;">
						<p class="cont_tit4">수강 시간</p>
						<input type="text" id="datepicker3"
							class="form-control form-control-date datepicker" readonly="readonly"> <select
							name="cooking_start_time" id="cooking_start_time"
							class="time_select">
							<option value="">시간</option>
							<option value="AM">AM</option>
							<option value="PM">PM</option>
						</select> <select name="cooking_start_hour" id="cooking_start_hour">
							<option value="">시</option>
							<option value="1">1시</option>
							<option value="2">2시</option>
							<option value="3">3시</option>
							<option value="4">4시</option>
							<option value="5">5시</option>
							<option value="6">6시</option>
							<option value="7">7시</option>
							<option value="8">8시</option>
							<option value="9">9시</option>
							<option value="10">10시</option>
							<option value="11">11시</option>
							<option value="12">12시</option>
						</select> : <select name="cooking_start_min" id="cooking_start_min">
							<option value="">분</option>
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
							<option value="50">50</option>
							<option value="60">60</option>
						</select> ~ <select name="cooking_end_time" id="cooking_end_time">
							<option value="">시간</option>
							<option value="AM">AM</option>
							<option value="PM">PM</option>
						</select> <select name="cooking_end_hour" id="cooking_end_hour">
							<option value="">시</option>
							<option value="1">1시</option>
							<option value="2">2시</option>
							<option value="3">3시</option>
							<option value="4">4시</option>
							<option value="5">5시</option>
							<option value="6">6시</option>
							<option value="7">7시</option>
							<option value="8">8시</option>
							<option value="9">9시</option>
							<option value="10">10시</option>
							<option value="11">11시</option>
							<option value="12">12시</option>
						</select> : <select name="cooking_end_min" id="cooking_end_min">
							<option value="">분</option>
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
							<option value="50">50</option>
							<option value="60">60</option>
						</select>
						<button type="button" onclick="addTime()" class="btn btn-default addIcon btn_add"
								style="margin-bottom: 19px;">
							<span class="glyphicon glyphicon-plus"></span>추가
						</button>
					</div>
					
					<div class="cont_line">
					<p class="cont_tit4">강의 시간표</p>
						<div id="timeTable">
						</div>
					</div>
					
				</div>

				<div class="cont_box pad_l_60">

					<script>
						$(function() {
							$("#postcodify_search_button").postcodifyPopUp();
						});
					</script>
					<div class="cont_line cPlace">
						<div class="col-xs-2">
							<p class="cont_tit4">강의 장소</p>
						</div>
						<div class="col-xs-10">
							<span>우편번호<input type="text"  style="width: 80px; margin-left: 17px;" name="postNum" id="postNum" class="form-control postcodify_postcode5"/></span>
							<button type="button" class="btn btn-default" id="postcodify_search_button">검색</button> 
							<span style="display: block;">주소<input type="text" style="margin-left: 45px;" name="addr" id="addr" class="form-control postcodify_address"/></span>
							<span style="display: block;">상세 주소<input type="text" style="margin-left: 13px;" name="addr2" id="addr2" class="form-control postcodify_details"/></span>
							
						</div>
					</div>
				</div>





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
						
						<select name="cooking_big_material" id="cooking_big_material" onchange="Mate();">
							<option value="">대분류</option>
							<c:forEach var="bing" items="${BingList }">
								<option value="${bing.big_ing_id }">${bing.big_ing_name }</option>
							</c:forEach>
						</select> <select name="cooking_mid_material" id="cooking_mid_material">
							<option value="">중분류</option>
							
						</select> 
						<input class="form-control mass numCheck" name="cooking_mass"
							id="cooking_mass" placeholder="예) 300"> 
							<select
							name="cooking_unit" id="cooking_unit">
							<option value="">단위</option>
							<c:forEach var="unit" items="${unit }">
								<option value="${unit.unit_id }">${unit.unit_name }</option>
							
							</c:forEach>
						</select>
						
						<input class="form-control mass numCheck" style="width: 85px;" name="cooking_price"
							id="cooking_price" placeholder="예)5000"><span class="setFont">원</span>

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

						</ul>

					</div>
					<p class="cont_tit4">
						<button type="button" onclick="addMoney()"
							class="btn btn-default">비용 추가</button>
						<span class="guide2 mag_b_15">예) 장소 대관비 / 5000원 </span>
					</p>

				</div>

				<div class="cont_box pad_l_60">

					<div class="cont_line pad_b_25">
						<p class="cont_tit4">요리소개</p>
						<textarea id="cooking_intro" name="cooking_intro"
							class="form-control cont_text"
							placeholder="예) 둘이 먹다 하나 죽어도 모르는 맛."></textarea>
					</div>


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
									onclick="사진업로드"
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
									onclick="사진업로드" alt="No Image">
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
									onclick="사진업로드" alt="No Image">
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
									onclick="사진업로드" alt="No Image">
							</div>

						</div>

					</div>

				</div>


			</div>
			<!-- 상단 입력 완료//////////////// -->
		</div>

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