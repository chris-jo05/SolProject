/**
 * 
 */

$(function() {
  $("#insert").validate({
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
		dname: {
			required: true
		},
		position: {
			required: true
		},
		birthday: {
			required: true,
			validBirth: true
		},
		mobile: {
			required: true,
			validMobile: true
		},
		id: {
			required: true,
			remote: {
				url:"/hrteam/checkId",
				type:"post",
				data:{
					id:function(){
						return $('#id').val();
					}
				}
			}
		},
		password: {
			required: true
		},
		address: {
			required: true
		},
		hireDate: {
			required: true
		},
		acou_name: {
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
		dname: {
			required: "부서를 선택해주세요."
		},
		position: {
			required: "직급을 선택해주세요."
		},
		birthday: {
			required: "생년월일을 입력해주세요."
		},
		mobile: {
			required: "휴대폰 번호를 입력해주세요."
		},
		id: {
			remote: "아이디가 중복되었습니다.",
			required: "아이디를 입력해주세요."
		},
		password: {
			required: "비밀번호를 입력해주세요."
		},
		address: {
			required: "주소를 입력해주세요."
		},
		hireDate: {
			required: "입사일을 입력해주세요."
		},
		acou_name: {
			required: "은행을 선택해주세요."
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
  "validBirth",
  function(value) {
    var regBirth = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
    return regBirth.test(value);
  },
  "형식에 맞게 입력해주세요."
);

$.validator.addMethod(
  "validMobile",
  function(value) {
    var regMobile = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    return regMobile.test(value);
  },
  "형식에 맞게 입력해주세요."
);

