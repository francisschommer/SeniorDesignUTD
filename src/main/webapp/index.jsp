<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html lang="en">
<head>
<title>Senior Design</title>
</head>
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

<body>





		<div class="container">
			
				<div class="form-group row">
					<label for="esInstance" class="col-sm-2 col-form-label">Elastic
						Search URL:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="esInstance"
							name="esInstance" value="${fn:escapeXml(param.esInstance)}">
					</div>
					<div class="offset-sm-2 col-sm-2">
						<button type="submit" class="btn btn-info">Connect</button>
					</div>
					<span class="error">${messages.esInstance}</span>
				</div>
		</div>
		<!--      <h1>Theme example</h1> -->
		<div class="container-fluid text-center">
			<div class="row content">
				<div class="col-sm-2 sidenav">

					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">Tags</h3>
						</div>
						<div class="panel-body">
							<div class="list-group">
								<a href="#" class="list-group-item">First item</a> <a href="#"
									class="list-group-item">Second item</a> <a href="#"
									class="list-group-item">Third item</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-8 text-left">
					<%--Add Viktoriya's panel here --%>
					<%-- <div class="panel panel-primary">
						<div class="panel-heading">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#range"
									class="panel-title">Range</a></li>
								<li><a data-toggle="tab" href="#exactvalue"
									class="panel-title">Exact Value</a></li>
							</ul>
						</div>
						<div class="panel-body">
							<div class="tab-content">
								<div id="range" class="tab-pane fade in active">
									<h3>Range</h3>

									<form class="form-inline">
										<label class="sr-only" for="inlineFormInput">Name</label> <input
											type="text" class="form-control mb-2 mr-sm-2 mb-sm-0"
											id="inlineFormInput" placeholder="10/24/2015"> to <label
											class="sr-only" for="inlineFormInput">Username</label>
										<div class="input-group mb-2 mr-sm-2 mb-sm-0">
											<input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0"
												id="inlineFormInputGroup" placeholder="10/24/2016">
										</div>

										<button type="submit" class="btn btn-primary">Submit</button>
									</form>
								</div>

								<div id="exactvalue" class="tab-pane fade">
									<h3>Exact Value</h3>
									<!-- <form class="form-inline">
								  <label class="sr-only" for="inlineFormInput">Name</label>
								  <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="inlineFormInput" placeholder="10/24/2015">
								
								  <button type="submit" class="btn btn-primary">Submit</button>
							</form> -->

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

					</div> --%>
					<%--add vika's form here: --%>
					<form action="index" method="post">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#exactvalue"
										class="panel-title">Exact Value</a></li>
									<li ><a data-toggle="tab" href="#range"
										class="panel-title">Range</a></li>
								</ul>
							</div>

							<div class="panel-body">
								<div class="tab-content">
									<div id="exactvalue" class="tab-pane fade in active">
										<h3>Exact Value</h3>
										
											<input id="output" name="output"
												placeholder="Enter Search term here"
												value="${fn:escapeXml(param.output)}">

											<button type="submit" name="button1" class="btn btn-success">Run
												Query</button>
											<p>
												<span class="error">${messages.name}</span> <span
													class="success">${messages.success}</span>
											</p>
										
									</div>
									<div id="range" class="tab-pane fade">
										<h3>Date of Birth Range</h3>
										
											<input name="rangeMin" id="rangeMin"
												placeholder="min range"
												value="${fn:escapeXml(param.rangeMin)}"> to 
											<input name="rangeMax" id="rangeMax"
												placeholder="max range"
												value="${fn:escapeXml(param.rangeMax)}">
											<button type="submit" name="button2" class="btn btn-success">Submit</button>
											<p>
												<span class="error">${messages.name}</span> <span
													class="success">${messages.success}</span>
											</p>
										
									</div>
								</div>
							</div>


						</div>

						<%-- <div class="panel panel-primary">
				<div class="panel-heading">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#result"
							class="panel-title">Result</a></li>
					</ul>
				</div>
				<div class="panel-body">
					<div class="tab-content">
						<div id="result" class="tab-pane fade in active">
							<h3>Result</h3>

							<div class="well">
								<span class="success">${messages.output}</span>
							</div>
						</div>
					</div>
				</div>
			</div> --%>


						<!-- <div class="col-sm-8 text-left">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#range"
							class="panel-title">Range</a></li>
						<li><a data-toggle="tab" href="#exactvalue"
							class="panel-title">Exact Value</a></li>
					</ul>
				</div>
				<div class="container-fluid text-center">
					<div class="row content">
						<div class="panel-body">
							<div class="tab-content">
								<div id="range" class="tab-pane fade in active">
									<h3>Range</h3>

									<form class="form-inline">
										<label class="sr-only" for="inlineFormInput">Name</label> <input
											type="text" class="form-control mb-2 mr-sm-2 mb-sm-0"
											id="inlineFormInput" placeholder="10/24/2015"> to <label
											class="sr-only" for="inlineFormInput">Username</label>
										<div class="input-group mb-2 mr-sm-2 mb-sm-0">
											<input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0"
												id="inlineFormInputGroup" placeholder="10/24/2016">
										</div>

										<button type="submit" class="btn btn-primary">Submit</button>
									</form>
								</div>
								
								<div id="exactvalue" class="tab-pane fade">
									<h3>Exact Value</h3>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div> -->
					</form>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#home"
									class="panel-title">Query Basic</a></li>
								<li><a data-toggle="tab" href="#menu1" class="panel-title">Advanced</a></li>
							</ul>
						</div>
						<div class="panel-body">
							<div class="tab-content">
								<div id="home" class="tab-pane fade in active">
									<h3>Drag and Drop</h3>
									<p>Where things get dragged n' dropped</p>
									<p>
										<!-- 										<button type="button" class="btn btn-success">Run -->
										<!-- 											Query</button> -->
									</p>
								</div>
								<div id="menu1" class="tab-pane fade">
									<h3>Advanced Query</h3>
									<p>
									<div class="form-horizontal">
										<div class="form-group">
											<div class="col-md-6">
												<textarea class="form-control" rows="8"
													placeholder="Required" required></textarea>
											</div>
										</div>
									</div>
									</p>

								</div>
							</div>
						</div>
					</div>



					<div class="panel panel-primary">
						<div class="panel-heading">
							<ul class="nav nav-tabs">
								<li><a data-toggle="tab" href="#result_home"
									class="panel-title">Result</a></li>
								<li class="active"><a data-toggle="tab" href="#report_home"
									class="panel-title">Report</a></li>
							</ul>
						</div>
						<div class="panel-body">
							<div class="tab-content">
								<div id="result_home" class="tab-pane fade ">
									<h3>Result</h3>
									<div class="well">
										<span class="success">${messages.fullElasticSearchOutput}</span>
									</div>
								</div>
								<div id="report_home" class="tab-pane fade in active">
									<h3>Report</h3>
									<div class="well">
										<span class="success">${messages.output}</span>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>


		<!-- 
	<div class="container theme-showcase" role="main">

		Main jumbotron for a primary marketing message or call to action
		<div class="jumbotron">
			<h1>Theme example</h1>
			<p>This is a template showcasing the optional theme stylesheet
				included in Bootstrap. Use it as a starting point to create
				something more unique by building on or modifying it.</p>

			<h3>
				<a href="hello?name=Sally">Click here...</a>
			</h3>
		</div>


		<div class="page-header">
			<h1>Buttons</h1>
		</div>
		<p>
			<button type="button" class="btn btn-lg btn-default">Default</button>
			<button type="button" class="btn btn-lg btn-primary">Primary</button>
			<button type="button" class="btn btn-lg btn-success">Success</button>
			<button type="button" class="btn btn-lg btn-info">Info</button>
			<button type="button" class="btn btn-lg btn-warning">Warning</button>
			<button type="button" class="btn btn-lg btn-danger">Danger</button>
			<button type="button" class="btn btn-lg btn-link">Link</button>
		</p>
		<p>
			<button type="button" class="btn btn-default">Default</button>
			<button type="button" class="btn btn-primary">Primary</button>
			<button type="button" class="btn btn-success">Success</button>
			<button type="button" class="btn btn-info">Info</button>
			<button type="button" class="btn btn-warning">Warning</button>
			<button type="button" class="btn btn-danger">Danger</button>
			<button type="button" class="btn btn-link">Link</button>
		</p>
		<p>
			<button type="button" class="btn btn-sm btn-default">Default</button>
			<button type="button" class="btn btn-sm btn-primary">Primary</button>
			<button type="button" class="btn btn-sm btn-success">Success</button>
			<button type="button" class="btn btn-sm btn-info">Info</button>
			<button type="button" class="btn btn-sm btn-warning">Warning</button>
			<button type="button" class="btn btn-sm btn-danger">Danger</button>
			<button type="button" class="btn btn-sm btn-link">Link</button>
		</p>
		<p>
			<button type="button" class="btn btn-xs btn-default">Default</button>
			<button type="button" class="btn btn-xs btn-primary">Primary</button>
			<button type="button" class="btn btn-xs btn-success">Success</button>
			<button type="button" class="btn btn-xs btn-info">Info</button>
			<button type="button" class="btn btn-xs btn-warning">Warning</button>
			<button type="button" class="btn btn-xs btn-danger">Danger</button>
			<button type="button" class="btn btn-xs btn-link">Link</button>
		</p>


		<div class="page-header">
			<h1>Tables</h1>
		</div>
		<div class="row">
			<div class="col-md-6">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Username</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<td>3</td>
							<td>Larry</td>
							<td>the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-6">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>#</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Username</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<td>3</td>
							<td>Larry</td>
							<td>the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>#</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Username</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td rowspan="2">1</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<td>Mark</td>
							<td>Otto</td>
							<td>@TwBootstrap</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<td>3</td>
							<td colspan="2">Larry the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-6">
				<table class="table table-condensed">
					<thead>
						<tr>
							<th>#</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Username</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<td>3</td>
							<td colspan="2">Larry the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>


		<div class="page-header">
			<h1>Thumbnails</h1>
		</div>
		<img data-src="holder.js/200x200" class="img-thumbnail"
			alt="A generic square placeholder image with a white border around it, making it resemble a photograph taken with an old instant camera">


		<div class="page-header">
			<h1>Labels</h1>
		</div>
		<h1>
			<span class="label label-default">Default</span> <span
				class="label label-primary">Primary</span> <span
				class="label label-success">Success</span> <span
				class="label label-info">Info</span> <span
				class="label label-warning">Warning</span> <span
				class="label label-danger">Danger</span>
		</h1>
		<h2>
			<span class="label label-default">Default</span> <span
				class="label label-primary">Primary</span> <span
				class="label label-success">Success</span> <span
				class="label label-info">Info</span> <span
				class="label label-warning">Warning</span> <span
				class="label label-danger">Danger</span>
		</h2>
		<h3>
			<span class="label label-default">Default</span> <span
				class="label label-primary">Primary</span> <span
				class="label label-success">Success</span> <span
				class="label label-info">Info</span> <span
				class="label label-warning">Warning</span> <span
				class="label label-danger">Danger</span>
		</h3>
		<h4>
			<span class="label label-default">Default</span> <span
				class="label label-primary">Primary</span> <span
				class="label label-success">Success</span> <span
				class="label label-info">Info</span> <span
				class="label label-warning">Warning</span> <span
				class="label label-danger">Danger</span>
		</h4>
		<h5>
			<span class="label label-default">Default</span> <span
				class="label label-primary">Primary</span> <span
				class="label label-success">Success</span> <span
				class="label label-info">Info</span> <span
				class="label label-warning">Warning</span> <span
				class="label label-danger">Danger</span>
		</h5>
		<h6>
			<span class="label label-default">Default</span> <span
				class="label label-primary">Primary</span> <span
				class="label label-success">Success</span> <span
				class="label label-info">Info</span> <span
				class="label label-warning">Warning</span> <span
				class="label label-danger">Danger</span>
		</h6>
		<p>
			<span class="label label-default">Default</span> <span
				class="label label-primary">Primary</span> <span
				class="label label-success">Success</span> <span
				class="label label-info">Info</span> <span
				class="label label-warning">Warning</span> <span
				class="label label-danger">Danger</span>
		</p>


		<div class="page-header">
			<h1>Badges</h1>
		</div>
		<p>
			<a href="#">Inbox <span class="badge">42</span></a>
		</p>
		<ul class="nav nav-pills" role="tablist">
			<li role="presentation" class="active"><a href="#">Home <span
					class="badge">42</span></a></li>
			<li role="presentation"><a href="#">Profile</a></li>
			<li role="presentation"><a href="#">Messages <span
					class="badge">3</span></a></li>
		</ul>


		<div class="page-header">
			<h1>Dropdown menus</h1>
		</div>
		<div class="dropdown theme-dropdown clearfix">
			<a id="dropdownMenu1" href="#" class="sr-only dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">Dropdown <span class="caret"></span></a>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
				<li class="active"><a href="#">Action</a></li>
				<li><a href="#">Another action</a></li>
				<li><a href="#">Something else here</a></li>
				<li role="separator" class="divider"></li>
				<li><a href="#">Separated link</a></li>
			</ul>
		</div>


		<div class="page-header">
			<h1>Navs</h1>
		</div>
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#">Home</a></li>
			<li role="presentation"><a href="#">Profile</a></li>
			<li role="presentation"><a href="#">Messages</a></li>
		</ul>
		<ul class="nav nav-pills" role="tablist">
			<li role="presentation" class="active"><a href="#">Home</a></li>
			<li role="presentation"><a href="#">Profile</a></li>
			<li role="presentation"><a href="#">Messages</a></li>
		</ul>


		<div class="page-header">
			<h1>Navbars</h1>
		</div>

		<nav class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Project name</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#about">About</a></li>
						<li><a href="#contact">Contact</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Dropdown <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li role="separator" class="divider"></li>
								<li class="dropdown-header">Nav header</li>
								<li><a href="#">Separated link</a></li>
								<li><a href="#">One more separated link</a></li>
							</ul></li>
					</ul>
				</div>
				/.nav-collapse
			</div>
		</nav>

		<nav class="navbar navbar-inverse">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Project name</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#about">About</a></li>
						<li><a href="#contact">Contact</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Dropdown <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li role="separator" class="divider"></li>
								<li class="dropdown-header">Nav header</li>
								<li><a href="#">Separated link</a></li>
								<li><a href="#">One more separated link</a></li>
							</ul></li>
					</ul>
				</div>
				/.nav-collapse
			</div>
		</nav>


		<div class="page-header">
			<h1>Alerts</h1>
		</div>
		<div class="alert alert-success" role="alert">
			<strong>Well done!</strong> You successfully read this important
			alert message.
		</div>
		<div class="alert alert-info" role="alert">
			<strong>Heads up!</strong> This alert needs your attention, but it's
			not super important.
		</div>
		<div class="alert alert-warning" role="alert">
			<strong>Warning!</strong> Best check yo self, you're not looking too
			good.
		</div>
		<div class="alert alert-danger" role="alert">
			<strong>Oh snap!</strong> Change a few things up and try submitting
			again.
		</div>


		<div class="page-header">
			<h1>Progress bars</h1>
		</div>
		<div class="progress">
			<div class="progress-bar" role="progressbar" aria-valuenow="60"
				aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
				<span class="sr-only">60% Complete</span>
			</div>
		</div>
		<div class="progress">
			<div class="progress-bar progress-bar-success" role="progressbar"
				aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
				style="width: 40%">
				<span class="sr-only">40% Complete (success)</span>
			</div>
		</div>
		<div class="progress">
			<div class="progress-bar progress-bar-info" role="progressbar"
				aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
				style="width: 20%">
				<span class="sr-only">20% Complete</span>
			</div>
		</div>
		<div class="progress">
			<div class="progress-bar progress-bar-warning" role="progressbar"
				aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
				style="width: 60%">
				<span class="sr-only">60% Complete (warning)</span>
			</div>
		</div>
		<div class="progress">
			<div class="progress-bar progress-bar-danger" role="progressbar"
				aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
				style="width: 80%">
				<span class="sr-only">80% Complete (danger)</span>
			</div>
		</div>
		<div class="progress">
			<div class="progress-bar progress-bar-striped" role="progressbar"
				aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
				style="width: 60%">
				<span class="sr-only">60% Complete</span>
			</div>
		</div>
		<div class="progress">
			<div class="progress-bar progress-bar-success" style="width: 35%">
				<span class="sr-only">35% Complete (success)</span>
			</div>
			<div class="progress-bar progress-bar-warning" style="width: 20%">
				<span class="sr-only">20% Complete (warning)</span>
			</div>
			<div class="progress-bar progress-bar-danger" style="width: 10%">
				<span class="sr-only">10% Complete (danger)</span>
			</div>
		</div>


		<div class="page-header">
			<h1>List groups</h1>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<ul class="list-group">
					<li class="list-group-item">Cras justo odio</li>
					<li class="list-group-item">Dapibus ac facilisis in</li>
					<li class="list-group-item">Morbi leo risus</li>
					<li class="list-group-item">Porta ac consectetur ac</li>
					<li class="list-group-item">Vestibulum at eros</li>
				</ul>
			</div>
			/.col-sm-4
			<div class="col-sm-4">
				<div class="list-group">
					<a href="#" class="list-group-item active"> Cras justo odio </a> <a
						href="#" class="list-group-item">Dapibus ac facilisis in</a> <a
						href="#" class="list-group-item">Morbi leo risus</a> <a href="#"
						class="list-group-item">Porta ac consectetur ac</a> <a href="#"
						class="list-group-item">Vestibulum at eros</a>
				</div>
			</div>
			/.col-sm-4
			<div class="col-sm-4">
				<div class="list-group">
					<a href="#" class="list-group-item active">
						<h4 class="list-group-item-heading">List group item heading</h4>
						<p class="list-group-item-text">Donec id elit non mi porta
							gravida at eget metus. Maecenas sed diam eget risus varius
							blandit.</p>
					</a> <a href="#" class="list-group-item">
						<h4 class="list-group-item-heading">List group item heading</h4>
						<p class="list-group-item-text">Donec id elit non mi porta
							gravida at eget metus. Maecenas sed diam eget risus varius
							blandit.</p>
					</a> <a href="#" class="list-group-item">
						<h4 class="list-group-item-heading">List group item heading</h4>
						<p class="list-group-item-text">Donec id elit non mi porta
							gravida at eget metus. Maecenas sed diam eget risus varius
							blandit.</p>
					</a>
				</div>
			</div>
			/.col-sm-4
		</div>


		<div class="page-header">
			<h1>Panels</h1>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Panel title</h3>
					</div>
					<div class="panel-body">Panel content</div>
				</div>
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Panel title</h3>
					</div>
					<div class="panel-body">Panel content</div>
				</div>
			</div>
			/.col-sm-4
			<div class="col-sm-4">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">Panel title</h3>
					</div>
					<div class="panel-body">Panel content</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">Panel title</h3>
					</div>
					<div class="panel-body">Panel content</div>
				</div>
			</div>
			/.col-sm-4
			<div class="col-sm-4">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h3 class="panel-title">Panel title</h3>
					</div>
					<div class="panel-body">Panel content</div>
				</div>
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h3 class="panel-title">Panel title</h3>
					</div>
					<div class="panel-body">Panel content</div>
				</div>
			</div>
			/.col-sm-4
		</div>


		<div class="page-header">
			<h1>Wells</h1>
		</div>
		<div class="well">
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
				Maecenas sed diam eget risus varius blandit sit amet non magna.
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent
				commodo cursus magna, vel scelerisque nisl consectetur et. Cras
				mattis consectetur purus sit amet fermentum. Duis mollis, est non
				commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem
				nec elit. Aenean lacinia bibendum nulla sed consectetur.</p>
		</div>


		<div class="page-header">
			<h1>Carousel</h1>
		</div>
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" data-role="listbox">
				<div class="item active">
					<img data-src="holder.js/1140x500/auto/#777:#555/text:First slide"
						alt="First slide">
				</div>
				<div class="item">
					<img data-src="holder.js/1140x500/auto/#666:#444/text:Second slide"
						alt="Second slide">
				</div>
				<div class="item">
					<img data-src="holder.js/1140x500/auto/#555:#333/text:Third slide"
						alt="Third slide">
				</div>
			</div>
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>


	</div>
	/container -->

		<!-- </form>  -->
</body>
</html>
