<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>NEWSONG J H.O.W 악기팀 - 일자별 개인경건생활표</title>
  <!-- Bootstrap core CSS-->
  <link href="resources/theme1/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="resources/theme1/vendor/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="resources/theme1/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="resources/theme1/css/sb-admin.css" rel="stylesheet">
  <!-- Custom styles for checkbox-->
  <link href="resources/theme1/css/checkbox.css" rel="stylesheet">
  
  <link href="resources/theme1/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
  <style type="text/css">
  </style>
	

</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <jsp:include page="include_menu.jsp"></jsp:include>

	<div class="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
        			<li class="breadcrumb-item active">경건생활</li>
			</ol>
			
			<div class="card mb-3">
		        <div class="card-header">
		          <i class="fa fa-table"></i> 경건생활 작성표 
		        </div>
		        <div class="card-body">
					<form action="insertReCh.do" method="post" id="religion-form">
						<!-- 회원정보 -->
						<div class="form-row">
							<div class="form-group col-md-3">
								<label for="inputName">이름</label>
								<input type="text"  class="form-control" name="name" id="inputName" readonly value="${sessionScope.userinfo.name}">
							</div>
							<div class="form-group col-md-3">
								<label for="inputAge">기수</label>
								<input type="text"  class="form-control" name="age" id="inputAge" readonly value="${sessionScope.userinfo.age.substring(0, 4)}">
							</div>
							<div class="form-group col-md-3">
								<label for="inputLevel">직분</label>
								<input type="text"  class="form-control" name="acc_lv" id="inputLevel" readonly value="${sessionScope.userinfo.acc_lv}">
							</div>
							<div class="form-group col-md-3">
		                			<label for="dtp_input2" class="control-label">날짜</label>
		                			<!-- 달력 glyphicon 은 현재 적용 안됨  -->
		                			<div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
		                    			<input class="form-control" name="date" id="date" size="16" type="text" placeholder ="click saturday" value="" readonly>
		                    			<span class="input-group-addon">
		                    				<span class="glyphicon glyphicon-remove"></span>
		                    			</span>
									<span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
		                			</div>
								<input type="hidden" id="dtp_input2" value="" /><br/>
		            			</div>
						</div>
							
						<!-- 수요일 -->
						<div class="form-group row">
							<input type="checkbox" name="wed_ser" id="wed_ser" autocomplete="off" value="Y" />
							<div class="btn-group col">
								<label for="wed_ser" class="btn btn-primary">
									<span class="fa fa-lg fa-check" ></span>
									<span></span>
								</label>
								<label for="wed_ser" class="btn btn-default active">수요예배</label>
							</div>
						
							<input type="checkbox" name="wed_pray" id="wed_pray" autocomplete="off" value="Y"/>
							<div class="btn-group col">
								<label for="wed_pray" class="btn btn-primary">
									<span class="fa fa-lg fa-check" ></span>
									<span></span>
								</label>
								<label for="wed_pray" class="btn btn-default active">수요기도회</label>
							</div>
							
							<input type="checkbox" name="sat_ser" id="sat_ser" autocomplete="off" value="Y"/>
							<div class="btn-group col">
								<label for="sat_ser" class="btn btn-primary">
									<span class="fa fa-lg fa-check" ></span>
									<span></span>
								</label>
								<label for="sat_ser" class="btn btn-default active">토요예배</label>
							</div>
							
							<input type="checkbox" name="sat_meet" id="sat_meet" autocomplete="off" value="Y"/>
							<div class="btn-group col">
								<label for="sat_meet" class="btn btn-primary">
									<span class="fa fa-lg fa-check" ></span>
									<span></span>
								</label>
								<label for="sat_meet" class="btn btn-default active">토요모임</label>
							</div>
						</div>
						<!-- 주일 -->
						<div class="form-group row">
							<input type="checkbox" name="sun_ser" id="sun_ser" autocomplete="off" value="Y"/>
							<div class="btn-group col">
								<label for="sun_ser" class="btn btn-primary">
									<span class="fa fa-lg fa-check" ></span>
									<span></span>
								</label>
								<label for="sun_ser" class="btn btn-default active">
									주일낮예배
								</label>
							</div>
							<input type="checkbox" name="sun_n_ser" id="sun_n_ser" autocomplete="off" value="Y"/>
							<div class="btn-group col">
								<label for="sun_n_ser" class="btn btn-primary">
									<span class="fa fa-lg fa-check" ></span>
									<span></span>
								</label>
								<label for="sun_n_ser" class="btn btn-default active">주일저녁예배</label>
							</div>
							<input type="checkbox" name="sun_pray" id="sun_pray" autocomplete="off" value="Y"/>
							<div class="btn-group col">
								<label for="sun_pray" class="btn btn-primary">
									<span class="fa fa-lg fa-check" ></span>
									<span></span>
								</label>
								<label for="sun_pray" class="btn btn-default active">주일기도회</label>
							</div>
							
							<input type="checkbox" name="sun_meet" id="sun_meet" autocomplete="off" value="Y"/>
							<div class="btn-group col">
								<label for="sun_meet" class="btn btn-primary">
									<span class="fa fa-lg fa-check" ></span>
									<span></span>
								</label>
								<label for="sun_meet" class="btn btn-default active">주일모임</label>
							</div>
						</div>
						
						<!-- 성경, 새벽 -->
						<div class="form-row">
							<div class="form-group col-md-3">
								<label for="bible" class="">성경</label>
								<input type="text" class="form-control" name="bible" id="bible" onkeydown="onlyNumber1(this)">
							</div>
							<div class="form-group col-md-3">
								<label for="early_p" class="">새벽</label>
								 <select name="early_p" id="early_p" class="form-control">
								 	<option value="0">0</option>
								 	<option value="1">1</option>
								 	<option value="2">2</option>
								 	<option value="3">3</option>
								 	<option value="4">4</option>
								 	<option value="5">5</option>
								 	<option value="6">6</option>
								 	<option value="7">7</option>
								 </select>
							</div>
							<div class="form-group col-md-6">
								<label for="note" class="">비고</label>
								<input type="text" class="form-control" name="note" id="note" placeholder ="사유 입력">
							</div>
							
						</div>
						
						<!-- 기도제목 -->
						<div class="form-group">
							<label for="exampleFormControlTextarea1">기도제목</label>
							<textarea class="form-control" name="pray_list" id="pray_list" rows="3"></textarea>
						</div>
						
						<!-- -->
						<div class="form-row" >
							<div class="form-group col-md-3" >
								<button type="submit" class="btn btn-success" style="width: 100%;">INSERT</button>
							</div>
						</div>
						
						
					</form>
				</div>  
      		</div>
      		
      		<div class="card mb-3">
		        <div class="card-header">
		          <i class="fa fa-table"></i> 경건생활 리스트
		        </div>
		        <div class="card-body">
		          <div class="table-responsive">
		            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		              <thead>
		                <tr>
							<th>날짜</th>
							<th>수요<br />예배</th>
							<th>수요<br />기도</th>
							<th>토요<br />예배</th>
							<th>주일<br />낮</th>
							<th>주일<br />저녁</th>
							<th>주일<br />기도</th>
							<th>성경</th>
							<th>새벽</th>
							<th>토요<br />모임</th>
							<th>주일<br />모임</th>
							<th>비고</th>
		                </tr>
		              </thead>
		              <tfoot>
		                <tr>
		                		<th>날짜</th>
							<th>수요<br />예배</th>
							<th>수요<br />기도</th>
							<th>토요<br />예배</th>
							<th>주일<br />낮</th>
							<th>주일<br />저녁</th>
							<th>주일<br />기도</th>
							<th>성경</th>
							<th>새벽</th>
							<th>토요<br />모임</th>
							<th>주일<br />모임</th>
							<th>비고</th>
		                </tr>
		              </tfoot>
		              <tbody>
						<c:forEach items="${religionChList}" var="religion">
						<tr>
							<td>${religion.date}</td>
							<td>${religion.wed_ser}</td>
							<td>${religion.wed_pray}</td>
							<td>${religion.sat_ser}</td>
							<td>${religion.sun_ser}</td>
							<td>${religion.sun_n_ser}</td>
							<td>${religion.sun_pray}</td>
							<td>${religion.bible}</td>
							<td>${religion.early_p}</td>
							<td>${religion.sat_meet}</td>
							<td>${religion.sun_meet}</td>
							<td>${religion.note}</td>
						</tr>
						</c:forEach>
		              </tbody>
		            </table>
		          </div>
		          
		          
		        </div>
		        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
			</div>
		</div>
	</div>
	<!-- /.content-wrapper-->
  	<jsp:include page="include_footer.jsp"></jsp:include>
    
    <!-- Bootstrap core JavaScript-->
    <script src="resources/theme1/vendor/jquery/jquery.js"></script>
    <script src="resources/theme1/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="resources/theme1/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="resources/theme1/vendor/datatables/jquery.dataTables.js"></script>
    <script src="resources/theme1/vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="resources/theme1/js/sb-admin.min.js"></script>
    <script src="resources/theme1/js/sb-admin-datatables.min.js"></script>
    <!-- Calendar Insert JavaScript -->
    <script type="text/javascript" src="resources/theme1/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="resources/theme1/js/locales/bootstrap-datetimepicker.ko.js" charset="UTF-8"></script>
    <script type="text/javascript">
		$(".form_date").datetimepicker({
	        language:  'ko',
	        weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	    });
		/* 유효성 검사 */
		$("#religion-form").submit(function() {
			/* 1. 날짜값 null & 토요일 체크 */
			var selDay = new Date($("#date").val()).getDay();
			if($("#date").val().length < 1 || selDay != '6'){
				alert("토요일을 선택하세요.");
				return false;
			}
			/* 2. 성경 읽기 데이터 3자리 이하 체크 */
			if($("#bible").val().length > 3){
				alert("읽은 성경의 장 수를 정확하게 입력하세요.");
				return false;
			}
			
			onlyNumber2($("#bible"));
			return true;
		});
		
		/* 달력에 토요일 입력 */
		$('.date').change(function() {
			var selDay = new Date($("#date").val()).getDay();
			if(selDay != '6'){
				$("#date").val('');
				alert("토요일을 선택하세요.");
			}
		});
		
		/* 성경, 키보드 입력 이벤트 발생시 문자는 공백으로 변경, 숫자만 입력 */
		function onlyNumber1(obj) {
			$(obj).keyup(function(){
				$(this).val($(this).val().replace(/[^0-9]/g,""));
			});
		}
		
		/* 입력데이터에 문자 섞여 있을 때 제거 */
		function onlyNumber2(obj) {
			$(obj).val($(obj).val().replace(/[^0-9]/g,""));
		}
		
		/* 날짜 내림차순 이벤트 : 페이지 호출시 웰브라우저가 HTML, CSS, JS를 인식한 다음 실행 */
		$(document).ready(function(){
			document.getElementsByClassName('sorting_asc')[0].click();
		});
	</script>

</body>
</html>