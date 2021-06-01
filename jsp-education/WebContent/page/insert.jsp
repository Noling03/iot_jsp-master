<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>insert</h3>

<script>
function reset_form() {
	document.input_form.reset();
}
</script>

<form action="action/insert_data.jsp" method="post" name="input_form">
	<p>피자 코드<input type="text" name="pizza_code"/></p>
	<p>피자 이름<input type="text" name="pizza_name"/></p>
	<p>피자 가격<input type="number" name="cost"/></p>
	<input type="submit" value="등록하기">
	<input type="button" value="다시쓰기" onclick="reset_form()">
</form>