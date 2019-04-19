<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp">
	<jsp:param name="title" value="Projects" />
</jsp:include>

<div id="content-wrapper">

	<div class="container-fluid">

		<h2>Projects</h2>

		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
			<li class="breadcrumb-item active">Projects</li>
		</ol>

		<!-- Area Chart Example-->
		<!--   <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-chart-area"></i>
            Area Chart Example</div>
          <div class="card-body">
            <canvas id="myAreaChart" width="100%" height="30"></canvas>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>-->

		<div class="row">
			<div class="col-lg-12">
			
			
			<c:choose> 
				<c:when test="${type eq 'fail_msg'}">
					<div class="alert fail-alert show" role="alert" style="padding: 6px;padding-left: 23px;margin-left: 17px;margin-right: 18px;">
					   <script type="text/javascript">
					   var msg='${fail_msg}';
						swal.fire(msg, "", "error");
</script>
					 
					</div>
				</c:when>
				<c:when test="${type eq 'suc_msg'}">
					<div class="alert suc-alert show" role="alert" style="padding: 6px;padding-left: 23px;margin-left: 17px;margin-right: 18px;">
					  <script type="text/javascript">
					   var msg='${suc_msg}';
						swal.fire(msg, "", "success");
</script>
					 
					</div>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
				<button class="btn btn-primary pull-right" data-toggle="modal"
					data-target="#addModal"
					style="margin-right: 23px; margin-bottom: 12px; float: right !important;">Add
					Project</button>

				<!-- Add Modal -->
				<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Add New
									Project</h5>
								<button class="close" type="button" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<form action="addProject" method="POST">
								<div class="modal-body">
									<div class="form-group">
										<label>Project Name: </label><label style="color: red;">&nbsp;&nbsp;*</label>
										<input type="text" class="form-control"
											placeholder="Enter Project Name" required name="projectname">
									</div>
									<div class="form-group">
										<label>Version: </label><label style="color: red;">&nbsp;&nbsp;*</label>
										<textarea rows="" cols="" class="form-control"
											required="required" name="version"
											placeholder="Enter Installed Applications"></textarea>
									</div>
									<div class="form-group">
										<label>Support Type: </label><label style="color: red;">&nbsp;&nbsp;*</label>
										<input type="text" class="form-control"
											placeholder="Enter Support type" required name="supporttype">
									</div>
									<div class="form-group">
										<label>Handover Date: </label><label style="color: red;">&nbsp;&nbsp;*</label>
										<input type="date" class="form-control" required
											name="handoverdate">
									</div>
									<div class="form-group">
										<label>City/Location: </label><label style="color: red;">&nbsp;&nbsp;*</label>
										<input type="text" class="form-control"
											placeholder="Enter City Name" required name="city">
									</div>
									<div class="form-group">
										<label>Country: </label><label style="color: red;">&nbsp;&nbsp;*</label>
										<input type="text" class="form-control"
											placeholder="Enter Country Name" required name="country">
									</div>
									<div class="form-group">
										<label>Customer Name: </label><label style="color: red;">&nbsp;&nbsp;*</label>
										<input type="text" class="form-control"
											placeholder="Enter Customer Name" required
											name="customername">
									</div>
									<div class="form-group">
										<label>Customer Number : </label><label style="color: red;">&nbsp;&nbsp;*</label>
										<input type="text" class="form-control"
											placeholder="Enter Customer Number" required
											name="customerno"  pattern="[0-9]+">
									</div>
									<div class="form-group">
										<label>Operation Manager: </label><label style="color: red;">&nbsp;&nbsp;*</label>
										<input type="text" class="form-control"
											placeholder="Enter Operation Manager Name" required
											name="operationmanager">
									</div>
									<div class="form-group">
										<label>Technical Manager: </label><label style="color: red;">&nbsp;&nbsp;*</label>
										<input type="text" class="form-control"
											placeholder="Enter Technical Manager Name" required
											name="technicalmanager">
									</div>
									<div class="form-group">
										<label>Account Manager: </label><label style="color: red;">&nbsp;&nbsp;*</label>
										<input type="text" class="form-control"
											placeholder="Enter Account Manager Name" required
											name="accountmanager">
									</div>
									<div class="form-group">
										<label>Delivery Manager: </label><label style="color: red;">&nbsp;&nbsp;*</label>
										<input type="text" class="form-control"
											placeholder="Enter Delivery Manager Name" required
											name="deliverymanager">
									</div>
									<div class="form-group">
						 			 <label>Closed:</label><label style="color:red;">&nbsp;&nbsp;*</label>
						  <select name="closedflag" id="closedflag" required class="form-control">
							<option value="-1" >Select Flag</option>
							<option value="Yes">YES</option>
							<option value="No">NO</option>
						 </select>
						</div>
								</div>
								<div class="modal-footer">
								 <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary" id="btnadd"
										name="btnadd">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- /.Add Modal -->

			</div>
		</div>

		<!-- DataTables Example -->
		<div class="card mb-3">
			<div class="card-header">
				<i class="fas fa-table"></i> Projects
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Sr No</th>
								<th>Project Name</th>
								<th>Handover Date</th>
								<th>City</th>
								<th>Country</th>
								<th>Operation Manager</th>
								<th>Account Manager</th>
								<th>Closed</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<%!
	int count=1;
%>
							<c:forEach items="${projectList}" var="list">
								<tr>
									<td><%=count++ %></td>
									<td>${list.projectname}</td>
									<td>${list.handoverdate}</td>
									<td>${list.city}</td>
									<td>${list.country}</td>
									<td>${list.operationmanager}</td>
									<td>${list.accountmanager}</td>
									<td>${list.closedflag }</td>
									<td><a target="_blank"
										href="project/view?id=${list.projectid}"
										style="color: #333333;"><i class="fa fa-list-alt"></i></a>&nbsp;&nbsp;&nbsp;
										
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<%
	 					count=1;
					%>
				</div>
			</div>
			
		</div>

	</div>
	<!-- /.container-fluid -->

	<!-- Sticky Footer -->
	<footer class="sticky-footer">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright © 2019-20 Sterlite Tech All Rights Reserved</span>
			</div>
		</div>
	</footer>




</div>
<!-- /.content-wrapper -->

<%@ include file="footer.jsp"%>
