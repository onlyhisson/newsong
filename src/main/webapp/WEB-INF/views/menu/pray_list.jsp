<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>NEWSONG J H.O.W 악기팀</title>
  <!-- Bootstrap core CSS-->
  <link href="resources/theme1/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="resources/theme1/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="resources/theme1/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="resources/theme1/css/sb-admin.css" rel="stylesheet">
  
  <link href="resources/theme1/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <jsp:include page="include_menu.jsp"></jsp:include>
  
	<div class="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
        			<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
				<li class="breadcrumb-item active">기도제목</li>
			</ol>
      <!-- Example DataTables Card-->
			<div class="card mb-3">
        			<div class="card-header">
          			<i class="fa fa-table"></i> 기도제목 (일자별) 
          		</div>
        			<div class="card-body">
        
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
	        
	          		<div class="table-responsive">
	            			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	              			<thead>
	                				<tr>
	                  				<th width="20%">   날짜</th>
	                  				<th width="80%">   기도제목</th>
	                				</tr>
	              			</thead>
	              			<tfoot>
	                				<tr>
	                  				<th>날짜</th>
	                  				<th>기도제목</th>
	                				</tr>
	              			</tfoot>
	              			<tbody>
	              			<c:forEach items="${userPraylist}" var="prayOne">
	                				<tr>
		                				<td>${prayOne.date}</td>
		                				<td>${prayOne.pray_list}</td>
	                				</tr>
							</c:forEach>
	              			</tbody>
	            			</table>
	        			</div>
      			</div>
				<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
    			</div>
		</div>
    <!-- /.container-fluid-->
	</div>
    <!-- /.content-wrapper-->
  	<jsp:include page="include_footer.jsp"></jsp:include>
    
    <!-- Bootstrap core JavaScript-->
    <script src="resources/theme1/vendor/jquery/jquery.min.js"></script>
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
    
	    
    		/* 달력 설정 */
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
		
		/* 달력에 토요일 입력 */
		$('.date').change(function() {
			var selDay = new Date($("#date").val()).getDay();
			var el = document.getElementById("search_value");
			if(selDay != '6'){
				$("#date").val('');
				alert("토요일을 선택하세요.");
			}else{
				$("#search_value").val($("#date").val());
				enter_event(el);
			}
		});
		
		/* 엔터 입력 발생 이벤트 */
		function enter_event(el) {
			// 이전 자바스크립트의 key 이벤트 함수 제약으로 keypress 이벤트 불가
			var e = $.Event("keyup");
			$(el).trigger(e); 
		}
		
		$(document).ready(function () {
			var el1 = document.getElementsByTagName("th");
			alert(el1.item(0).val());
			//enter_event(el1.item('1'));
    		});
		
		/* 날짜 내림차순 이벤트 : 페이지 호출시 웰브라우저가 HTML, CSS, JS를 인식한 다음 실행 */
		$(document).ready(function(){
			document.getElementsByClassName('sorting_asc')[0].click();
		});
	</script>
    
</body>

</html>
