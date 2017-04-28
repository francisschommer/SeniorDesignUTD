<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Servlet Hello World</title>

<!--  Here is where I take in the header accross all pages -->
<jsp:include page="/WEB-INF/views/header_footer.jsp"></jsp:include>

<style>
.error {
	color: red;
}

.success {
	color: green;
}
</style>
</head>
<body>
	<form action="helloServlet" method="post">

		<div class="panel panel-primary">
			<div class="panel-heading">
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#range"
						class="panel-title">Key</a></li>
				</ul>
			</div>
			<div class="panel-body">
				<div class="tab-content">
					<div id="range" class="tab-pane fade in active">
						<h3>Keyword</h3>

						<form class="form-inline">
							<input id="output" name="output"
								placeholder="Enter Search term here"
								value="${fn:escapeXml(param.output)}">

							<button type="submit" class="btn btn-primary">Submit</button>
							<p>
								<span class="error">${messages.name}</span> <span
									class="success">${messages.success}</span>
							</p>
						</form>
					</div>
				</div>
			</div>


		</div>

		<div class="panel panel-primary">
			<div class="well">
				<span class="success">${messages.output}</span>
			</div>
		</div>
	</form>
</body>
</html>