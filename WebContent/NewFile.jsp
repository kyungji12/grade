<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv='Content-Type' content="text/html; charset=utf-8">
<title>InsertForm</title>
<style>
table {
   border: 1px solid #444444;
   border-collapse: collapse;
   margin-left: auto;
   margin-right: auto;
}

td {
   border: 1px solid #444444;
   padding: 5px;
}

#button_cell {
   border-top: 1px solid #FFFFFF;
   border-left: 1px solid #FFFFFF;
   border-right: 1px solid #FFFFFF;
   colspan: '2';
}
</style>
<script>
   function validate() {
      var re_name = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{1,10}$/; // 이름 적합한지 검사할 정규식
      var re_score = /^[0-9]{1,3}$/;
      var name = document.getElementById("name");
      var kor = document.getElementById("kor");
      var eng = document.getElementById("eng");
      var mat = document.getElementById("mat");
   
      if (insert.name.value == "") { // 이름칸이 비어있을 때
         alert("이름을 입력하세요.");
         insert.name.focus();
         return false;
      }

      if (insert.kor.value == "") { // 국어점수 칸이 비어있을 떄
         alert("국어점수를 입력하세요.");
         insert.kor.focus();
         return false;
      }

      if (insert.eng.value == "") { // 영어점수 칸이 비어있을 때
         alert("영어점수를 입력하세요.");
         insert.eng.focus();
         return false;
      }

      if (insert.mat.value == "") { // 수학점수 칸이 비어있을 때
         alert("수학점수를 입력하세요.");
         insert.mat.focus();
         return false;
      }

      if(insert.kor.value<0 || insert.kor.value>100
       ||insert.eng.value<0||insert.eng.value>100
       ||insert.mat.value<0||insert.mat.value>100) { // 점수 칸의 값이 0~100의 범위가 아닐 때
       alert("점수는 0~100점 사이만 입력 가능합니다.");
       return false;
       } 

      if (!check(re_name, name, "이름은 10자이내의 한글이나 영어로 입력하세요")) {
         return false;
      }
      if (!check(re_score, kor, "점수는 0~100점 사이의 숫자로만 입력하세요")) {
         return false;
      }

      if (!check(re_score, eng, "점수는 0~100점 사이의 숫자로만 입력하세요")) {
         return false;
      }

      if (!check(re_score, mat, "점수는 0~100점 사이의 숫자로만 입력하세요")) {
         return false;
      }
   }

   function check(re, what, message) {
      if (re.test(what.value)) {
         return true;
      }
      alert(message);
      what.value = "";
      what.focus();
      //return false;
   }
</script>
</head>
<body>
   <h1 align='center'>성적입력추가</h1>
   <form action='?contentPage=insertDB.jsp' onsubmit='return validate();'
      method='post' name='insert'>

      <table>
         <tr align='right'>
            <td id='button_cell' colspan='2'><input type='submit'
               value='추가'></td>
         </tr>
         <tr align='center'>
            <td>이름</td>
            <td><input type='text' name="name" id="name"/></td>
         </tr>
         <tr align='center'>
            <td>학번</td>
            <td>자동부여</td>
         </tr>
         <tr align='center'>
            <td>국어</td>
            <td><input type='text' name='kor' id="kor" /></td>
         </tr>
         <tr align='center'>
            <td>영어</td>
            <td><input type='text' name='eng' id="eng" /></td>
         </tr>
         <tr align='center'>
            <td>수학</td>
            <td><input type='text' name='mat' id="mat" /></td>
         </tr>

      </table>
   </form>
</body>
</html>