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


// found here: http://stackoverflow.com/documentation/servlets/2857/getting-started-with-servlets/9958/hello-world-with-dopost#t=201704210417150548408

@WebServlet("/helloServlet")
public class HelloServletController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Preprocess request: we actually don't need to do any business stuff, so just display JSP.
        request.getRequestDispatcher("/WEB-INF/views/helloServlet.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Postprocess request: gather and validate submitted data and display the result in the same JSP.

        // Prepare messages.
        Map<String, String> messages = new HashMap<String, String>();
        request.setAttribute("messages", messages);
        
        //Map<String, String> messages1 = new HashMap<String, String>();
        //request.setAttribute("messages1", messages1);

        // Get and validate name.
        
       /* String key = request.getParameter("key");
        if(key == null || key.trim().isEmpty()){
        	messages.put("key", "Add in a key please");
        }*/
        
        String name = request.getParameter("name");
   /*     if (name == null || name.trim().isEmpty() ) {
            messages.put("name", "Please enter key");
        }*/
        
        /* else if (!name.matches("\\p{Alnum}+")) { //here is regex info: http://www.vogella.com/tutorials/JavaRegularExpressions/article.html
            messages.put("name", "Please enter alphanumeric characters only");
        }*/

        // Get and validate age.
        /*String age = request.getParameter("age");
        if (age == null || age.trim().isEmpty() || key != null) {
            messages.put("age", "Please enter range");*/
        //} /*else if (!age.matches("\\d+")) {
            //messages.put("age", "Please enter digits only");
        //}
        
        String output = request.getParameter("output");
     //   output = request.
        //output = "tons of shit";
        
        // No validation errors? Do the business job!
        /*if (messages1.isEmpty()) {
            messages1.put("keysuccess", String.format("Your keyword is %s!", key));
        }*/
        if (messages.isEmpty()) {
        	
    //    	messages.put("success", String.format("Hello, your keyword is %s!", name));
        	Main.main("localhost",9300);
        	
        	TransportClient c = new PreBuiltTransportClient(Settings.EMPTY).addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("localhost"), 9300));
        //	SearchResponse testJTmain = Main.searchKeywordValue(client, output);
        	SearchResponse results;
            //System.out.println("SEARCHING");
            results = c.prepareSearch()
                    .setTypes()
                    .setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
                    //.setQuery(QueryBuilders.matchQuery(value))
                    .setQuery(QueryBuilders.multiMatchQuery(output, "_all")) //I put output here
                    .setFrom(0).setSize(60).setExplain(true)
                    .get();
            String total = "";
            //total will be a list (json) of all the 'hits' which is probable more useful for our purposes.
            SearchHit[] hits = results.getHits().getHits();
            for(SearchHit hit : hits) {
                total += hit.getSourceAsString();
                total += "\n";
            }
            //System.out.println(total);
            //return SearchResponse (an ElasticSearch class)
       // 	client.close(); 
        	
        	output = "Your search for: \"" + output + "\" returned the following: "+ total;
            messages.put("output", String.format("%s", output)); //I forgot an %s
        }
        
       

        request.getRequestDispatcher("/WEB-INF/views/helloServlet.jsp").forward(request, response);
    }
    
    
    /*@RequestMapping(value="/controller", method=GET)
    public void foo(HttpServletResponse res) {
        try {       
            PrintWriter out = res.getWriter();
            out.println("Hello, world!");
            out.close();
        } catch (IOException ex) { 
            ...
        }
    }*/
    
}