<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
</div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->   
  <script src="<c:url value ="/vendor/jquery/jquery.min.js"></c:url>"></script> 
  <script src="<c:url value ="/vendor/bootstrap/js/bootstrap.bundle.min.js"></c:url>" ></script>

  <!-- Core plugin JavaScript-->
  <script src="<c:url value ="/vendor/jquery-easing/jquery.easing.min.js"></c:url>" ></script>

  <!-- Page level plugin JavaScript-->
  <script src="<c:url value ="/vendor/chart.js/Chart.min.js"></c:url>" ></script>
  <script src="<c:url value ="/vendor/datatables/jquery.dataTables.js"></c:url>" ></script>
  <script src="<c:url value ="/vendor/datatables/dataTables.bootstrap4.js"></c:url>" ></script>

  <!-- Custom scripts for all pages-->
  <script src="<c:url value ="/js/sb-admin.min.js"></c:url>" ></script>

  <!-- Demo scripts for this page-->
  <script src="<c:url value ="/js/demo/datatables-demo.js"></c:url>" ></script>
  <script src="<c:url value ="/js/demo/chart-area-demo.js"></c:url>" ></script>
  
  
   
  
<script>
  $(document).ready(function(){
		 $('#dataTable').DataTable();
	});
  </script>
</body>

</html>
