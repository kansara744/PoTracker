<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
			<i class="fas fa-table"></i> Governance Info
		</div>
		<div class="card-body">
			<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<tbody>
				
				<c:forEach items="${listGov}" var="list">
					
					<tr>
					<td>Project Name:</td>
					<td>${list.projectname}</td>
					</tr>
					<tr>
					<td>Doc Type:</td>
					<td>${list.doctype}</td>
					</tr>
					<tr>
					<td>Call Date:</td>
					<td>${list.calldate}</td>
					</tr>
					<tr>
					<td>Participants Names:</td>
					<td>${list.participantsnames}</td>
					</tr>
					<tr>
					<td>Subject:</td>
					<td>${list.participantsnames}</td>
					</tr>
					<tr>
					<td>MOM:</td>
					<td><a href="${FileDownloadURL}mom/${list.mom}">${list.mom}</a></td>
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