function modal_submit() {
	if(infoConfirm())
		document.joinForm.submit();
}

function infoConfirm() {
	
	inputText("");
	
	var email = document.joinForm.email.value;
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	if(document.joinForm.email.value == 0) {
		inputText("이메일을 입력해주세요.")
		return false;
	}
	
	if(exptext.test(email) == false) {
		inputText("이메일 형식을 올바르게 입력해주세요.")
		return false;
	}
	
	if(document.joinForm.password.value  == 0) {
		inputText("비밀번호를 입력하세요.");
		return false;
	}
	
	if(document.joinForm.password.value.length > 10) {
		inputText("비밀번호를 10자 이하로 입력하세요.");
		return false;
	}
	
	if(document.joinForm.password.value != document.joinForm.pw_ch.value) {
		inputText("비밀번호 확인이 일치하지 않습니다.");
		return false;
	}
	
	if(document.joinForm.name.value.length < 1) {
		inputText("이름을 입력해주세요.");
		return false;
	}
	return true;
}

function inputText(a) {
	var msg = a;
	document.joinForm.guide_msg.value=msg;
}




