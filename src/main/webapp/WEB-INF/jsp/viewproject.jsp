<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Project</title>
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
					<c:forEach items="${projectInfo}" var="list">
					
					<tr>
					<td>Project Name:</td>
					<td>${list.projectname}</td>
					</tr>
					<tr>
					<td>Project Description:</td>
					<td>${list.version}</td>
					</tr>
					<tr>
					<td>Support Type:</td>
					<td>${list.supporttype}</td>
					</tr>
					<tr>
					<td>Handover Date:</td>
					<td>${list.handoverdate}</td>
					</tr>
					<tr>
					<td>City:</td>
					<td>${list.city}</td>
					</tr>
					<tr>
					<td>Country:</td>
					<td>${list.country}</td>
					</tr>
					<tr>
					<td>Customer Name:</td>
					<td>${list.customername}</td>
					</tr>
					<tr>
					<td>Customer No:</td>
					<td>${list.customerno}</td>
					</tr>
					<tr>
					<td>Operation Manager:</td>
					<td>${list.operationmanager}</td>
					</tr>
					<tr>
					<td>Technical Manager:</td>
					<td>${list.technicalmanager}</td>
					</tr>
					<tr>
					<td>Account Manager:</td>
					<td>${list.accountmanager}</td>
					</tr>
					<tr>
					<td>Delivery Manager:</td>
					<td>${list.deliverymanager}</td>
					</tr>
					<tr>
					<td>Closed Flag:
					</td>
					<td>${list.closedflag }</td>
					</tr>
					<tr>
					<td>Modify By:</td>
					<td>${list.modifyby}</td>
					</tr>
					<tr>
					<td>Createdate:</td>
					<td>${list.createdate}</td>
					</tr>
					<tr>
					<td>Modifydate:</td>
					<td>${list.modifydate}</td>
					</tr>
					</c:forEach>
				
				</tbody>
			
			
			
			</table>
			
			</div>
		</div>
	</div>

</body>
</html>