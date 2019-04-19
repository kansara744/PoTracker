<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp">
	  <jsp:param name="title" value="Governance"/>
</jsp:include>

 <div id="content-wrapper">

      <div class="container-fluid">

		<h2>Governance Details</h2>
		
        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Governance</li>
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
				<button class="btn btn-primary pull-right" data-toggle="modal" data-target="#addModal" style="margin-right: 23px;margin-bottom: 12px;float: right !important;">Add Governance Detail</button>
		 
		 		<!-- Add Modal --> 
				<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			      <div class="modal-content">
			        <div class="modal-header">
			          <h5 class="modal-title" id="exampleModalLabel">Add New Governance Details</h5>
			          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
			            <span aria-hidden="true">×</span>
			          </button>
			        </div>
			        <form action="addGov" method="POST" enctype="multipart/form-data" >
			        	<div class="modal-body">
			        	<div class="form-group">
						  <label>Project Name :</label><label style="color:red;">&nbsp;&nbsp;*</label>
						  <select name="projectid" id="projectid" required class="form-control">
							<option value="-1" >Select Project</option>
							 <c:forEach items="${projectList}" var="prolist" >
								<option value="${prolist.projectid}">${prolist.projectname}</option>
							</c:forEach>
						 </select>
						</div>
						<div class="form-group">
						  <label>Doc Type :</label><label style="color:red;">&nbsp;&nbsp;*</label>
						  <select name="doctype" id="doctype" required class="form-control">
							<option value="-1" >Select Doctype</option>
							<option value="GovernanceMail" >Governance mail</option> 
							<option value="EOLMail" >EOL mail</option>
							<option value="ExceptionApprovalMail">Exception Approval Mail</option>
							<option value="SupportResumeMail" >Support Resume mail</option> 
						 </select>
						</div>
						<div class="form-group">
							  <label>Subject: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							 	<textarea rows="" cols="" class="form-control" name="subject" required placeholder="Enter Subject"></textarea>
							</div>
			        		<div class="form-group">
							  <label>Call Date: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							  <input type="date" class="form-control"  required name="calldate">
							</div>
							<div class="form-group">
							  <label>Participants Names: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							 	<textarea rows="" cols="" class="form-control" name="participantsnames" required placeholder="Enter participants name"></textarea>
							</div>
							<div class="form-group">
						  <label>Upload MOM:</label><label style="color:red;">&nbsp;&nbsp;*</label>
						  <input type="file" class="form-control" required id="title_img" name="file" required>
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
            <i class="fas fa-table"></i>
           Governance</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  	<th>Sr No.</th>
                    <th>Project Name:</th>
                    <th>Call Date:</th>
                    <th>Doctype</th>
                    <th>Participants Name:</th>
                    <th>Subject:</th>
                    <th>Actions:</th>
                  </tr>
                </thead>
                <tbody>
                	<%!
	int count=1;
%>
                <c:forEach items="${govList}" var="list">
                  <tr>
                  	<td><%=count++ %></td>
                    <td>${list.projectname}</td>
                    <td>${list.calldate}</td>
                    <td>${list.doctype}</td>
                    <td>${list.participantsnames}</td>
                    <td>${list.subject}</td>
					<td>
					<a target="_blank"
										href="/gov/view?id=${list.gvid}"
										style="color: #333333;"><i class="fa fa-list-alt"></i></a>&nbsp;&nbsp;&nbsp;
						<a href="" style="color:#333333;" data-target="#editModal${list.gvid}" data-toggle="modal"><i class="fa fa-edit"></i></a>&nbsp;&nbsp;&nbsp;
					
						<!-- Add Modal --> 
				<div class="modal fade" id="editModal${list.gvid}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			      <div class="modal-content">
			        <div class="modal-header">
			          <h5 class="modal-title" id="exampleModalLabel">Update Governance Details</h5>
			          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
			            <span aria-hidden="true">×</span>
			          </button>
			        </div>
			        <form action="updateGov" method="POST" enctype="multipart/form-data" >
			        	<div class="modal-body">
			        	<div class="form-group">
			        	<input type="hidden" name="gvid" value="${list.gvid }">
						  <label>Project Name :</label><label style="color:red;">&nbsp;&nbsp;*</label>
						  <select name="projectid"  value="${list.projectid}" id="projectid<c:out value="${list.gvid}"></c:out>" disabled required class="form-control">
										<!--<option value="-1" >Select Product Category</option> -->
										<c:forEach items="${projectList}" var="prolist" >
											<c:set var = "pid" value="${list.projectid}"></c:set>
											<c:set var = "cid" value="${prolist.projectid}"></c:set>
											<c:choose>
												<c:when test="${pid == cid}">
													<option selected="selected" value="${prolist.projectid}">${prolist.projectname}</option>
												</c:when>
												<c:otherwise>
													<option value="${prolist.projectid}">${prolist.projectname}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									 </select>
						</div>
						<div class="form-group">
						  <label>Doc Type :</label><label style="color:red;">&nbsp;&nbsp;*</label>
						  <!-- <select name="doctype" id="doctype" required class="form-control">
							<option value="-1" >Select Doctype</option>
							<option value="GovernanceMail" >Governance mail</option> 
							<option value="EOLMail" >EOL mail</option>
							<option value="ExceptionMail" >Exception mail</option>
							<option value="ApprovalMail" >Approval mail</option>
							<option value="SupportResumeMail" >Support Resume mail</option> 
						 </select> -->
						 	   <select name="doctype" id="doctype" required class="form-control">
									 	<c:set var = "ps" value="${list.doctype}"></c:set>
									 	<c:choose>
											<c:when test="${ps eq 'GovernanceMail'}">
												<option selected="selected" value="GovernanceMail">Governance Mail</option>
												<option value="EOLMail">EOL Mail</option>
												<option value="ExceptionApprovalMail">Exception Approval Mail</option>
												<option value="SupportResumeMail">Support Resume Mail</option>
											</c:when>
											<c:when test="${ps eq 'EOLMail'}">
												<option selected="selected" value="EOLMail">EOL Mail</option>
												<option value="GovernanceMail">Governance Mail</option>
												<option value="ExceptionApprovalMail">Exception Approval Mail</option>
												<option value="SupportResumeMail">Support Resume Mail</option>
											</c:when>
											<c:when test="${ps eq 'ExceptionApprovalMail'}">
												<option selected="selected" value="ExceptionApprovalMail">Exception Approval Mail</option>
												<option value="GovernanceMail">Governance Mail</option>
												<option value="EOLMail">EOL Mail</option>
												<option value="SupportResumeMail" >Support Resume mail</option> 
											</c:when>
											<c:otherwise>
											<option value="SupportResumeMail" >Support Resume Mail</option> 
												<option value="GovernanceMail" >Governance Mail</option> 
							<option value="EOLMail" >EOL Mail</option>
							<option value="ExceptionApprovalMail">Exception Approval Mail</option>
						
											</c:otherwise>
										</c:choose>
									 </select>
						</div>
						<div class="form-group">
							  <label>Subject: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							 	<textarea rows="" cols="" class="form-control" name="subject" required placeholder="Enter Subject">${list.subject}</textarea>
							</div>
			        		<div class="form-group">
							  <label>Call Date: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							  <input type="date" class="form-control"  required name="calldate" value="${list.calldate}">
							</div>
							<div class="form-group">
							  <label>Participants Names: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							 	<textarea rows="" cols="" class="form-control" name="participantsnames"  required placeholder="Enter participants name" >${list.participantsnames}</textarea>
							</div>
							<div class="form-group">
						  <label>Upload MOM:</label><label style="color:red;">&nbsp;&nbsp;*</label>
						  <input type="file" class="form-control"  id="title_img" name="file" >
						</div>
							
							
			       		 </div>
			       <div class="modal-footer">
			         <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary" id="btnadd"
										name="btnadd">Update</button>
			        </div>
			        </form>
			      </div>
			    </div>
			  </div>
					
					
					
					
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
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>




    </div>
    <!-- /.content-wrapper -->
    
<%@ include file="footer.jsp" %>    
