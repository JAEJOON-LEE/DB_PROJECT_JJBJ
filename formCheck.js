function loginCheck(obj){
	if(!obj.id.value || obj.id.value.trim().length == 0){
		alert("아이디가 입력되지 않았습니다.");
		obj.id.value ="";
		obj.id.focus();
		return false;
	}
	
	if(!obj.pw.value || obj.pw.trim().length == 0){
		alert("비밀번호를 입력해주세요.");
		obj.pw.value ="";
		obj.pw.focus();
		return false;
	}
	return true;
}
