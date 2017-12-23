// 전역변수 ajax 선언
var ajax = null;

// 함수 정의(createAjax())
function createAjax()
{
   // 객체를 생성하는 방식의 차이일 뿐이지 두 가지 모두 XMLHttpRequest 객체를 생성하는 구문이다
   // → AJAX 활용
   
   if (window.ActiveXObject) // IE 8 이하라면
   {
      // ActiveXObject 객체 생성하여 반환
      return new ActiveXObject("Msxml2.XMLHTTP");
   }
   else   // 외의 브라우저
   {
      if (window.XMLHttpRequest)   // XMLHttpRequest 객체 활용 가능 여부 확인
      {
         // XMLHttpRequest() 객체 생성하여 반환
         return new XMLHttpRequest();
      }
      else   // XMLHttpRequest 객체 활용 불가
      {
         // Ajax 지원 불가
         return null;
      }
   }
}