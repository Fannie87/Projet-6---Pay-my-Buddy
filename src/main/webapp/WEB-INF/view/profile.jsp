<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<jsp:include page="layout/head.jsp" /> 
<body>
	<jsp:include page="layout/nav.jsp" />  
	<div class="container">
		<nav aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item"><a href="home">Home</a></li>
		    <li class="breadcrumb-item active" aria-current="page">Profile</li>
		  </ol>
		</nav>
		<br/>
		<h3> Your current balance is ${sessionScope.balance} euro(s).</h3>
	
		<br>
        <h3>Supply your balance</h3>
       	<form:form method="POST" action="/supply-success" modelAttribute="profileAmountSupply">
			<div class="mb-3 row">
				<div class="col-sm-4">
				<form:select path="idAccount" class="form-select" cssErrorClass="form-select is-invalid">
				    <form:option value="NONE"> --Select Account--</form:option>
					<form:options items="${sessionScope.mapAccounts}"></form:options>
				</form:select>
				<form:errors path = "idAccount" id="idAccount" cssClass = "invalid-feedback" />
				</div>
				<div class="col-sm-4">
              		<form:input class="form-control" path="balance" cssErrorClass="form-control is-invalid"  placeholder="0"/>
              		<form:errors path = "balance" id="balance" cssClass = "invalid-feedback"/>
             	</div>
				<div class="col-sm-2">
					<input type="submit" class="btn btn-success" value="Supply"/>
	         	</div>
	        </div>
       	</form:form>
       	<form:form method="POST" action="/debit-success" modelAttribute="profileAmountDebit">
       		<br>
			<h3>Debit your money to your bank account</h3>
			<div class="mb-3 row">
				<div class="col-sm-4">
				<form:select path="idAccount" class="form-select"  cssErrorClass="form-select is-invalid">
				    <form:option value="NONE"> --Select Account--</form:option>
					<form:options items="${sessionScope.mapAccounts}"></form:options>
				</form:select>
				<form:errors path = "idAccount" id="idAccount" cssClass = "invalid-feedback" />
				</div>
				<div class="col-sm-4">
              		<form:input class="form-control" path="balance" cssErrorClass="form-control is-invalid" placeholder="0" />
              		<form:errors path = "balance" id="balance" cssClass = "invalid-feedback"/>
             	</div>
				<div class="col-sm-2">
					<input type="submit" class="btn btn-success" value="Debit"/>
	         	</div>
			</div>
		</form:form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

</body>
</html>