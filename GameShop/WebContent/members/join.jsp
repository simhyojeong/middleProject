<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<meta name="google-signin-client_id"
			content="498083484217-7bcja9ncmqch5eok1j2a1lhr3m8vl8pd.apps.googleusercontent.com">
		<title>회원가입</title>
		<script src="../js/jquery-3.6.0.min.js"></script>
		<script src="../js/jquery-3.6.2.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="../css/join.css">
		<style>
			input[type=text],
			input[type=password],
			input[type=email] {
				font-size: 14px;
			}

			input::placeholder {
				font-size: 14px;
			}

			input[type='date'] {
				font-size: 14px;
				color: rgb(118, 118, 118)
			}

			#disp,
			#disp2 {
				margin: 5px;
				font-size: 14px;
				white-space: nowrap;
			}

			.jss44 {
				font-size: 14px;
			}

			#modal {
				position: relative;
				width: 100%;
				height: 100%;
				z-index: 1;
				display: none;
			}

			#modal h2 {
				margin: 0;
			}

			#modal button {
				display: inline-block;
				width: 100px;
				margin-left: calc(100% - 100px - 10px);
			}

			#modal .modal_content {
				width: 300px;
				margin: 100px auto;
				padding: 20px 10px;
				background: #fff;
				border: 2px solid #666;
			}

			#modal .modal_layer {
				position: fixed;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				background: rgba(0, 0, 0, 0.5);
				z-index: -1;
			}
		</style>
	</head>

	<body style="background-color: black">
		<div role="presentation" class="MuiDialog-root" header="header.signUp"
			style="position: fixed; z-index: 1300; inset: 0px;">
			<div tabindex="0" data-test="sentinelStart"></div>
			<div class="MuiDialog-container MuiDialog-scrollBody" role="none presentation" tabindex="-1"
				style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;">
				<div class="MuiPaper-root MuiDialog-paper MuiDialog-paperScrollBody MuiDialog-paperWidthSm MuiPaper-elevation0 MuiPaper-rounded"
					role="dialog">
					<div class="MuiDialogContent-root sc-jJEKmz eoYCft" id="modal-content">
						<div class="sc-hiSbEG yeDSp"></div>
						<div class="sc-gWHigU iCPaAK">
							<div style="opacity: 1; transform: none;">
							<div class="logo"><a href="/main.do"><img src="../images/beans_logo.png" alt="" style="width:50px; "></a></div>
								<div spacing="6" class="sc-bdfBQB idiyhX">
									<h6 class="MuiTypography-root sc-dmlqKv gKbqoA sc-hHfuMS epIHKZ MuiTypography-subtitle2 MuiTypography-colorTextPrimary MuiTypography-alignCenter"
										style="font-size: 2em">가입</h6>
								</div>
								<!-- <form action="/members/join.do" method="post" class="sc-eCstlR iMhQAk" id="join"> -->
								<form action="/members/auth.do" method="post" class="sc-eCstlR iMhQAk" id="join">
									<!-- 아이디 입력 영역 -->
									<div class="MuiFormControl-root MuiTextField-root MuiFormControl-fullWidth">
										<div
											class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-fullWidth MuiInputBase-formControl MuiInputBase-adornedEnd MuiOutlinedInput-adornedEnd">
											<input aria-invalid="false" autocomplete="id" name="mem_id" id="mem_id"
												required="required" type="text" placeholder="아이디 *" inputmode="text"
												aria-label="아이디" aria-errormessage="displayName-error" maxlength="16"
												class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputAdornedEnd MuiOutlinedInput-inputAdornedEnd"
												value="">
											<div id="disp"></div>
										</div>
									</div>
									<!-- 비밀번호 입력 영역 -->
									<div class="MuiFormControl-root MuiTextField-root MuiFormControl-fullWidth">
										<div
											class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-fullWidth MuiInputBase-formControl MuiInputBase-adornedEnd MuiOutlinedInput-adornedEnd">
											<input aria-invalid="false" autocomplete="new-password" name="mem_pw"
												id="mem_pw" required type="password" pattern="[a-z0-9]{7,}"
												placeholder="비밀번호 (영문 숫자 포함 8자리)*" inputmode="text" aria-label="비밀번호"
												aria-errormessage="password-error"
												class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputAdornedEnd MuiOutlinedInput-inputAdornedEnd"
												value="">
										</div>
									</div>
									<!-- 비밀번호 확인 입력 영역 -->
									<div class="MuiFormControl-root MuiTextField-root MuiFormControl-fullWidth">
										<div
											class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-fullWidth MuiInputBase-formControl MuiInputBase-adornedEnd MuiOutlinedInput-adornedEnd">
											<input aria-invalid="false" autocomplete="new-password" id="mem_pw2"
												name="password" required type="password" placeholder="비밀번호 확인 *"
												inputmode="text" aria-label="비밀번호확인" aria-errormessage="password-error"
												class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputAdornedEnd MuiOutlinedInput-inputAdornedEnd"
												value="">
											<div id="disp2"></div>
										</div>
									</div>
									<!-- 이메일 입력 영역 -->
									<div class="MuiFormControl-root MuiTextField-root MuiFormControl-fullWidth">
										<div
											class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-fullWidth MuiInputBase-formControl">
											<input aria-invalid="false" autocomplete="email" name="mem_mail"
												id="mem_mail" required="required" type="email" inputmode="email"
												pattern="[a-zA-Z0-9]+@[a-zA-Z0-9]+(\.[a-z]{2,3})" aria-label="이메일 주소"
												aria-errormessage="email-error" autocapitalize="none" spellcheck="false"
												placeholder="이메일 (xxxx@xx.com) *"
												class="MuiInputBase-input MuiOutlinedInput-input" value="">
										</div>
									</div>
									<!-- 이름 입력 영역 -->
									<div class="sc-clsFYl iWvwJB">
										<div class="MuiFormControl-root MuiTextField-root MuiFormControl-fullWidth">
											<div
												class="MuiInputBase-root MuiOutlinedInput-root Mui-error Mui-error MuiInputBase-fullWidth MuiInputBase-formControl">
												<input aria-invalid="true" autocomplete="name" name="mem_name"
													id="mem_name" required placeholder="이름 *" type="text"
													inputmode="text" aria-label="성명" aria-errormessage="name-error"
													class="MuiInputBase-input MuiOutlinedInput-input" value=""
													aria-describedby="name-helper-text">
											</div>
										</div>
									</div>
									<!-- 전화번호 입력 영역 -->
									<div class="MuiFormControl-root MuiTextField-root MuiFormControl-fullWidth">
										<div
											class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-fullWidth MuiInputBase-formControl">
											<input aria-invalid="false" autocomplete="mem_ph" name="mem_ph" id="mem_ph"
												pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required type="text" inputmode="ph"
												aria-label="전화번호" aria-errormessage="ph-error" autocorrect="off"
												autocapitalize="none" spellcheck="false"
												placeholder="전화번호 (010-0000-0000)*"
												class="MuiInputBase-input MuiOutlinedInput-input" value="">
										</div>
									</div>
									<!-- 생일 입력 영역 -->
									<div class="MuiFormControl-root MuiTextField-root MuiFormControl-fullWidth">
										<div
											class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-fullWidth MuiInputBase-formControl">
											<input aria-invalid="false" autocomplete="text" name="mem_birth"
												id="mem_birth" required type="date" inputmode="text" aria-label="생년월일"
												aria-errormessage="text-error" autocapitalize="none" spellcheck="false"
												required placeholder="생년월일 8자리 *"
												class="MuiInputBase-input MuiOutlinedInput-input" value="">
										</div>
									</div>
									<!-- 제출 버튼 영역 -->
									<div spacing="6" class="sc-bdfBQB sc-dlfnuX hLrQQY bdzcew">
										<button
											class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary jss40 MuiButton-disableElevation MuiButton-fullWidth"
											tabindex="0" type="submit" id="btn-submit" aria-label="계속">
											<span class="MuiButton-label"><span class="jss44">계속</span></span>
										</button>
									</div>
								</form>
								<div class="sc-gKseQn bnjmag">
									<span class="MuiTypography-root sc-dmlqKv gKbqoA MuiTypography-body2">
										이미 계정이 있으신가요?&nbsp;</span> <a
										class="MuiTypography-root MuiLink-root MuiLink-underlineAlways sc-bBrNTY dPLqrm MuiTypography-colorTextPrimary"
										href="login.do" id="to-login" aria-label="로그인"><span
											class="MuiTypography-root sc-dmlqKv gKbqoA sc-cOajNj jsMVcl MuiTypography-body2">로그인</span></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div tabindex="0" data-test="sentinelEnd"></div>
		</div>
		<script>
			$('#mem_pw2').on('keyup', function () {
				let pw = $('#mem_pw').val();
				let pw2 = $('#mem_pw2').val();

				if (pw == pw2) {
					$('#disp2').html('일치').css('color', 'green');
				} else {
					$('#disp2').html('불일치').css('color', 'red');
					return;
				}
			});

			$('#mem_id').on('keyup', function () {

				//아이디 값 가져오기
				let v_idVal = $('#mem_id').val();

				//공백제거
				if (v_idVal.trim().length == 0)
					return;

				$.ajax({
					type: 'post',
					url: 'idCheck.jsp',
					data: {
						'mem_id': v_idVal
					},
					success: function (aaa) {
						if (aaa.rst == "ok") {
							$('#disp').html(aaa.msg).css('color', 'green');
						} else {
							$('#disp').html(aaa.msg).css('color', 'red');
						}
					},
					error: function (xhr) {
						alert("상태:" + xhr.status);
					},
					dataType: 'json'
				})
			});

			$('#join').on('submit', function () {
				if ($('#disp').text() == '사용불가') {
					alert("아이디 중복을 확인해주세요");
					return false;
				} else if ($('#disp2').text() == '불일치') {
					alert("비밀번호 확인이 다릅니다");
					return false;
				}
				return true;
			});

		</script>
	</body>

	</html>