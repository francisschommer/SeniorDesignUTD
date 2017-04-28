package com.utd.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.transport.client.PreBuiltTransportClient;

@WebServlet("/index")
public class IndexServletController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// Preprocess request: we actually don't need to do any business stuff,
		// so just display JSP.
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// Postprocess request: gather and validate submitted data and display
		// the result in the same JSP.

		// Prepare messages.
		Map<String, String> messages = new HashMap<String, String>();
		request.setAttribute("messages", messages);

		// Map<String, String> messages1 = new HashMap<String, String>();
		// request.setAttribute("messages1", messages1);

		// Get and validate name.

		/*
		 * String key = request.getParameter("key"); if(key == null ||
		 * key.trim().isEmpty()){ messages.put("key", "Add in a key please"); }
		 */

		String name = request.getParameter("name");
		/*
		 * if (name == null || name.trim().isEmpty() ) { messages.put("name",
		 * "Please enter key"); }
		 */

		/*
		 * else if (!name.matches("\\p{Alnum}+")) { //here is regex info:
		 * http://www.vogella.com/tutorials/JavaRegularExpressions/article.html
		 * messages.put("name", "Please enter alphanumeric characters only"); }
		 */

		// Get and validate age.
		/*
		 * String age = request.getParameter("age"); if (age == null ||
		 * age.trim().isEmpty() || key != null) { messages.put("age",
		 * "Please enter range");
		 */
		// } /*else if (!age.matches("\\d+")) {
		// messages.put("age", "Please enter digits only");
		// }

		
		String rangeMin = request.getParameter("rangeMin");
		String rangeMax = request.getParameter("rangeMax");
		String output = request.getParameter("output");
		// output = request.
		// output = "tons of shit";

		// No validation errors? Do the business job!
		/*
		 * if (messages1.isEmpty()) { messages1.put("keysuccess",
		 * String.format("Your keyword is %s!", key)); }
		 */
		if (messages.isEmpty()) {
			if(request.getParameter("button1") != null){
				System.out.println("pressed button 1");
				if (output != null) {
					if (output.length() > 0) {
						TransportClient c = new PreBuiltTransportClient(
								Settings.EMPTY)
								.addTransportAddress(new InetSocketTransportAddress(
										InetAddress.getByName("localhost"), 9300));
						// SearchResponse testJTmain =
						// Main.searchKeywordValue(client, output);
						SearchResponse results;
						// System.out.println("SEARCHING");
						results = c
								.prepareSearch()
								.setTypes()
								.setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
								// .setQuery(QueryBuilders.matchQuery(value))
								.setQuery(
										QueryBuilders.multiMatchQuery(output,
												"_all")) // I put output here
								.setFrom(0).setSize(60).setExplain(true).get();
						String total = "";
						// total will be a list (json) of all the 'hits' which is
						// probable more useful for our purposes.
						SearchHit[] hits = results.getHits().getHits();
						for (SearchHit hit : hits) {
							total += hit.getSourceAsString();
							total += "\n";
						}
						// System.out.println(total);
						// return SearchResponse (an ElasticSearch class)
						// client.close();

						output = "Your search for: \"" + output
								+ "\" returned the following: " + total;
						messages.put("output", String.format("%s", output)); // I
																				// forgot
																				// an
																				// %s
						messages.put("fullElasticSearchOutput", results.toString());
					} else if (output.length() == 0) {
						messages.put("output", "You did not search for a term!");
					}
			}}
			else if(request.getParameter("button2") != null){
				System.out.println("pressed button 2");
				if (rangeMin != null & rangeMax != null) {
					System.out.println(rangeMin + " " + rangeMax);
					if (rangeMin.length() > 0 & rangeMax.length() > 0) {
						TransportClient c = new PreBuiltTransportClient(
								Settings.EMPTY)
								.addTransportAddress(new InetSocketTransportAddress(
										InetAddress.getByName("localhost"), 9300));
						SearchResponse results;
				        results = c.prepareSearch().setTypes()
				                .setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
				                .setPostFilter(QueryBuilders.rangeQuery("dateOfBirth").from(rangeMin).to(rangeMax))
				                .setFrom(0).setSize(60).setExplain(true)
				                .get();
				        String total = "";
						// total will be a list (json) of all the 'hits' which is
						// probable more useful for our purposes.
						SearchHit[] hits = results.getHits().getHits();
						for (SearchHit hit : hits) {
							total += hit.getSourceAsString();
							total += "\n";
						}
						output = "Your search range of min: " + rangeMin + " to max: " + rangeMax +" returned: \""
								+ "\" returned the following: " + total;
						//messages.put("output", "range min: " + rangeMin + " range max: " + rangeMax);
				        messages.put("fullElasticSearchOutput", results.toString());
						messages.put("output", output);
					} else if (rangeMin.length() == 0 || rangeMax.length() == 0) {
						messages.put("output","You did not include a min and/or MAX!");
					}
				}
			}
			// messages.put("success",
			// String.format("Hello, your keyword is %s!", name));
			// Main.main("localhost",9300);
			
			
			
		}

		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
}
