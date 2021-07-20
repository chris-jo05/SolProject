/**
 * 
 */

$(function() {
  $("#update").validate({
    errorPlacement: function(error, element) {
      $(element)
        .closest("form")
        .find("small[id='" + element.attr("id") + "']")
        .append(error);
    },
	rules: {
		ename: {
			required: true,
			minlength: 2
		},
		mobile: {
			required: true,
			validMobile: true
		},
		id: {
			required: true
		},
		password: {
			required: true
		},
		address: {
			required: true
		},
		acount: {
			required: true
		},
		gender: {
			required: true
		}
		
	},
	messages: {
		ename: {
			required: "이름은 입력 해주세요.",
			minlength:"이름은 최소 2자리 이상 입력하셔야합니다."
		},
		mobile: {
			required: "휴대폰 번호를 입력해주세요."
		},
		id: {
			required: "아이디를 입력해주세요."
		},
		password: {
			required: "비밀번호를 입력해주세요."
		},
		address: {
			required: "주소를 입력해주세요."
		},
		acount: {
			required: "계좌번호를 입력해주세요."
		},
		gender: {
			required: "성별을 선택해주세요."
		}
	}
	});
});

$.validator.addMethod(
  "validMobile",
  function(value) {
    var regMobile = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    return regMobile.test(value);
  },
  "형식에 맞게 입력해주세요."
);

