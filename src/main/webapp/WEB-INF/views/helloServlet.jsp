<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Servlet Hello World</title>
        
        <!--  Here is where I take in the header accross all pages -->
	<jsp:include page="/WEB-INF/views/header_footer.jsp"></jsp:include>
	
        <style>.error { color: red; } .success { color: green; }</style>
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
<%-- 								  <input id="name" name="name" placeholder="hello" value="${fn:escapeXml(param.name)}"> --%>
								   <input id="output" name="output" placeholder="Enter Search term here" value="${fn:escapeXml(param.output)}">
								 
								  <button type="submit" class="btn btn-primary">Submit</button>
								  <p>
								  <span class="error">${messages.name}</span>

								  <span class="success">${messages.success}</span></p>
							</form>
							</div>
						</div>
						</div>
						
						
						</div>
						
						<div class="panel panel-primary">
						<div class="well"> 
<%-- 						 <input id="output" name="output"  value="${fn:escapeXml(param.output)}"></span></div> --%>
 						 <span class="success">${messages.output}</span>
						</div>
						</div>
        
<%--         				<div class="panel panel-primary">
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
								  <input id="name" name="name" placeholder="10/25/2015" value="${fn:escapeXml(param.name)}">
								   to 
				                <input id="age" name="age" placeholder="10/25/2015" value="${fn:escapeXml(param.age)}">
								  <button type="submit" class="btn btn-primary">Submit</button>
								  <p>
								  <span class="error">${messages.name}</span>
								   <span class="error">${messages.age}</span>
								  <span class="success">${messages.success}</span></p>
							</form>
							</div>
						</div>
					
				</div>
				
				<div class="panel panel-primary">
					<div class="panel-heading">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#home"
							class="panel-title">Query Basic</a></li>
						</ul>
					</div>
					<div class="panel-body">
						<div class="tab-content">
							<div id="home" class="tab-pane fade in active">
								<h3>Drag and Drop</h3>
								<label class="sr-only" for="inlineFormInput">Key</label>
								  <form class="form-inline">
								  <input id="key" name="key" placeholder="keyword" value="${fn:escapeXml(param.key)}">
								  <button type="submit" class="btn btn-primary">Submit</button>
								  <p>
								  <span class="error">${messages.key}</span>
								  <span class="success">${messages.success}</span></p>
							</form>
							</div>
							
						</div>
					</div>
				</div> --%>
                
            </p>
        </form>
    </body>
</html>