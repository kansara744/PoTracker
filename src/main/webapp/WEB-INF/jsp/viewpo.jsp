<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
td {
  word-break: break-all;
}

</style>
<meta charset="UTF-8">
<title>View PO</title>
<link href="<c:url value ="/vendor/fontawesome-free/css/all.min.css"></c:url>" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="<c:url value ="/vendor/datatables/dataTables.bootstrap4.css"></c:url>" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<c:url value ="/css/sb-admin.min.css"></c:url>" rel="stylesheet">
</head>
<body>

<div class="card mb-3">
		<div class="card-header">
			<i class="fas fa-table"></i> Project Info
		</div>
		<div class="card-body">
			<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<tbody>
				
				
				<c:forEach items="${listpo}" var="list">
					
					<tr>
					<td>Project Name:</td>
					<td>${list.projectname}</td>
					</tr>
					<tr>
					<td>PO Type:</td>
					<td>${list.potype}</td>
					</tr>
					<tr>
					<td>PO Number:</td>
					<td>${list.ponumber}</td>
					</tr>
					<tr>
					<td>PO Date:</td>
					<td>${list.podate}</td>
					</tr>
					<tr>
					<td>Amount:</td>
					<td>${list.amount}</td>
					</tr>
					<tr>
					<td>Start Date:</td>
					<td>${list.startdate}</td>
					</tr>
					<tr>
					<td>End Date:</td>
					<td>${list.enddate}</td>
					</tr>
					<tr>
					<td>HR Cost:</td>
					<td>${list.hrcost}</td>
					</tr>
					<tr>
					<td>Thirdparty Cost:</td>
					<td>${list.thirdpartycost}</td>
					</tr>
					<tr>
					<td>WBS Code:</td>
					<td>${list.wbscode}</td>
					</tr>
					<tr>
					<td>PO File:</td>
					<td><a href="${FileDownloadURL}po/${list.pofile}">${list.pofile}</a></td>
					</tr>
					<tr>
					<td>Create Date:</td>
					<td>${list.createdate}</td>
					</tr>
					<tr>
					<td>Modify Date:</td>
					<td>${list.modifydate}</td>
					</tr>
					<tr>
					<td>Modify By:</td>
					<td>${list.modifyby}</td>
					</tr>
					</c:forEach>
				
				</tbody>
				
				</table>
				
				
				</div>
				</div>
				</div>
				
</body>
</html>