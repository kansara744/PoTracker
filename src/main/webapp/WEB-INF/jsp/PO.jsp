<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp">
	  <jsp:param name="title" value="Po Tracker"/>
</jsp:include>





 <div id="content-wrapper">

      <div class="container-fluid">

		<h2>PO Tracker</h2>
		
        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Po Tracker</li>
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
          
				<button class="btn btn-primary pull-right" data-toggle="modal" data-target="#addModal" style="margin-right: 23px;margin-bottom: 12px;float: right !important;">Add PO Tracker</button>
		 
		 		<!-- Add Modal --> 
				<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			      <div class="modal-content">
			        <div class="modal-header">
			          <h5 class="modal-title" id="exampleModalLabel">Add New PO Tracker</h5>
			          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
			            <span aria-hidden="true">×</span>
			          </button>
			        </div>
			        <form action="addPO" method="POST" enctype="multipart/form-data">
			        	<div class="modal-body">
			        	<div class="form-group">
						  <label>Project Name :</label><label style="color:red;">&nbsp;&nbsp;*</label>
						  <select name="projectid" id="projectid" required class="form-control">
							<option value="-1" >Select Project</option>
							<c:forEach items="${projectList}" var="list" >
								<option value="${list.projectid}">${list.projectname}</option>
							</c:forEach>
						 </select>
						</div>
						<div class="form-group">
						  <label>PO Type:</label><label style="color:red;">&nbsp;&nbsp;*</label>
						  <select name="potype" id="potype" required class="form-control">
							<option value="-1" >Select Type</option>
							<option value="AMC">AMC</option>
							<option value="MS">MS</option>
							<option value="CR">CR</option>
							<option value="WARRANTY">WARRANTY</option>
						 </select>
						</div>
						<div class="form-group">
							  <label>PO Number: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							  <input type="text" class="form-control" placeholder="Enter PO number" required name="ponumber">
							</div>
			        		<div class="form-group">
							  <label>PO Date: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							  <input type="date" class="form-control"  required name="podate">
							</div>
							<div class="form-group">
							  <label>PO Amount: </label><label style="color:red;">&nbsp;&nbsp;*</label><p>[Amount Without tax. Convert to INR consider 1 USD=65 INR]</p>
							  <input type="text" class="form-control" placeholder="Enter PO Amount" required name="amount"  pattern="[0-9]+">
							</div>
							<div class="form-group">
							  <label>Start Date: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							  <input type="date" class="form-control"  required name="startdate">
							</div>
							<div class="form-group">
							  <label>End Date: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							  <input type="date" class="form-control"  required name="enddate">
							</div>
							<div class="form-group">
							  <label>HR Cost: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							  <input type="text" class="form-control" placeholder="Enter Budget cost" required name="hrcost" pattern="[0-9]+">
							</div>
							<div class="form-group">
							  <label>ThirdParty Cost: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							  <input type="text" class="form-control" placeholder="Enter Thirdparty Cost" required name="thirdpartycost" pattern="[0-9]+">
							</div>
							<div class="form-group">
							  <label>WBS Code: </label>
							  <input type="text" class="form-control" placeholder="Enter wbsc code"  name="wbscode">
							</div>
							<div class="form-group">
						  <label>PO File:</label><label style="color:red;">&nbsp;&nbsp;*</label>
						  <input type="file" class="form-control" required id="title_img" name="file">
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
           PO Tracker</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  	<th>Sr No</th>
                  	 <th>Project Name</th>
                    <th>PO Number</th>
                    <th>PO Date</th>
                    <th>Amount</th>
                     <th>Start Date</th>
                    <th>End Date</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                							<%!
	int count=1;
%>
                <c:forEach items="${polist}" var="list">
                	<tr>
                		<td><%=count++ %></td>
                		<td>${list.projectname}</td>
                		<td>${list.ponumber}</td>
                		<td>${list.podate}</td>
                		<td>${list.amount}</td>
                		<td>${list.startdate}</td>
                		<td>${list.enddate}</td>
                		
                		
                		<td><a target="_blank"
										href="po/view?id=${list.poid}"
										style="color: #333333;"><i class="fa fa-list-alt"></i></a>&nbsp;&nbsp;&nbsp;
		<a href="" style="color:#333333;" data-target="#editModal${list.poid}" data-toggle="modal"><i class="fa fa-edit"></i></a>&nbsp;&nbsp;&nbsp;							
		<div class="modal fade" id="editModal${list.poid}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			      <div class="modal-content">
			        <div class="modal-header">
			          <h5 class="modal-title" id="exampleModalLabel">Update PO Tracker</h5>
			          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
			            <span aria-hidden="true">×</span>
			          </button>
			        </div>
			        <form action="updatePo" method="POST" enctype="multipart/form-data">
			        	<div class="modal-body">
			        	<div class="form-group">
			        	<input type="hidden" name="poid" value="${list.poid }">
						  <label>Project Name :</label><label style="color:red;">&nbsp;&nbsp;*</label>
						  <select name="projectid"  value="${list.projectid}" id="projectid<c:out value="${list.poid}"></c:out>" disabled required class="form-control">
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
						  <%-- <select name="projectid" id="projectid" value="${list.po}" required class="form-control">
							<option value="-1" >Select Project</option>
							<c:forEach items="${projectList}" var="list" >
								<option value="${list.projectid}">${list.projectname}</option>
							</c:forEach>
						 </select> --%>
						</div>
						<div class="form-group">
						  <label>PO Type:</label><label style="color:red;">&nbsp;&nbsp;*</label>
						   <select name="potype" id="potype" required class="form-control">
									 	<c:set var = "ps" value="${list.potype}"></c:set>
									 	<c:choose>
											<c:when test="${ps eq 'AMC'}">
												<option selected="selected" value="AMC">AMC</option>
												<option value="MS">MS</option>
												<option value="CR">CR</option>
												<option value="WARRANTY">WARRANTY</option>
											</c:when>
											<c:when test="${ps eq 'MS'}">
												<option selected="selected" value="MS">MS</option>
												<option value="AMC">AMC</option>
												<option value="CR">CR</option>
												<option value="WARRANTY">WARRANTY</option>
											</c:when>
											<c:when test="${ps eq 'WARRANTY'}">
												<option selected="selected" value="WARRANTY">WARRANTY</option>
												<option value="AMC">AMC</option>
												<option value="CR">CR</option>
												<option value="MS">MS</option>
											</c:when>
											<c:otherwise>
												<option value="CR">CR</option>
												<option value="MS">MS</option>
												<option value="AMC">AMC</option>
												<option value="WARRANTY">WARRANTY</option>
											</c:otherwise>
										</c:choose>
									 </select>
						  <!-- <select name="potype" id="potype" required class="form-control">
							<option value="-1" >Select UOM</option>
							<option value="amc">AMC</option>
							<option value="ms">MS</option>
							<option value="cr">CR</option>
						 </select> -->
						</div>
						<div class="form-group">
							  <label>PO Number: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							  <input type="text" class="form-control" value="${list.ponumber}"  placeholder="Enter PO number" required name="ponumber">
							</div>
			        		<div class="form-group">
							  <label>PO Date: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							  <input type="date" class="form-control" value="${list.podate }"  required name="podate">
							</div>
							<div class="form-group">
							  <label>PO Amount: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							  <input type="text" class="form-control" placeholder="Enter PO Amount" required name="amount" value="${list.amount}" pattern="[0-9]+">
							</div>
							<div class="form-group">
							  <label>Start Date: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							  <input type="date" class="form-control"  required name="startdate" value="${list.startdate }">
							</div>
							<div class="form-group">
							  <label>End Date: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							  <input type="date" class="form-control"  required name="enddate" value="${list.enddate }">
							</div>
							<div class="form-group">
							  <label>HR Cost: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							  <input type="text" class="form-control" placeholder="Enter Budget cost" value="${list.hrcost }" required name="hrcost" pattern="[0-9]+">
							</div>
							<div class="form-group">
							  <label>ThirdParty Cost: </label><label style="color:red;">&nbsp;&nbsp;*</label>
							  <input type="text" class="form-control" placeholder="Enter Thirdparty Cost" required name="thirdpartycost"  value="${list.thirdpartycost }" pattern="[0-9]+">
							</div>
							<div class="form-group">
							  <label>WBS Code: </label>
							  <input type="text" class="form-control" placeholder="Enter wbsc code"  name="wbscode" value="${list.wbscode }">
							</div>
							<div class="form-group">
						  <label>PO File:</label><label style="color:red;">&nbsp;&nbsp;*</label>
						  <input type="file" class="form-control"  id="title_img" name="file" value="${list.pofile }"> 
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
