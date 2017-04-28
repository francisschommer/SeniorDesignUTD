package com.utd.controller;



import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.transport.client.PreBuiltTransportClient;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.UnknownHostException;

import static java.lang.System.out;


public class Main {

	//public TransportClient client;
	
    public static void main(String hostName, int port) throws UnknownHostException{
        TransportClient client = new PreBuiltTransportClient(Settings.EMPTY)
                .addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName(hostName), port));
        //grab all nodes and print/create json file
        //printJsonToFile(client);
        System.out.println(client.admin().toString());



        // System.out.println("tesst searchKeywordValue");
        
     /*   String json = "{\"Breed\":\"Husky\",\"dateOfBirth\":2015,\"Name\":\"Francis Schommer\"}";
        putstuff(client, json, "animals", "dogs");
        json = "{\"Breed\":\"Dobie\",\"dateOfBirth\":2011,\"Name\":\"Cody Cornelius\"}";
        putstuff(client, json, "animals", "dogs");
        json = "{\"Breed\":\"Hound\",\"dateOfBirth\":2008,\"Name\":\"Viktoriya Kozmina\"}";
        putstuff(client, json, "animals", "dogs");
        json = "{\"Breed\":\"Retriever\",\"dateOfBirth\":2003,\"Name\":\"Micah Leigh\"}";
        putstuff(client, json, "animals", "dogs");
        json = "{\"Breed\":\"Pomeranian\",\"dateOfBirth\":2017,\"Name\":\"J.T. Sutherland\"}";
        putstuff(client, json, "animals", "dogs");*/
       // System.out.println(searchKeywordValue(client, "animals", "dogs", "Breed", "Husky"));
        //printJsonToFile(client);

        searchKeywordValue(client);


    }

    public static void printJsonToFile(Client c){
        SearchResponse response = c.prepareSearch().get();
        SearchHit[] hits = response.getHits().getHits();
        String total = "";
        for(SearchHit hit : hits)
            total += hit.getSourceAsString();
 
        PrintWriter printJson = null;
        File outputJson = new File("data2.json");
        try {
            outputJson.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            printJson= new PrintWriter(outputJson);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        printJson.flush();
        printJson.println("OMGOMGOMOMGMOGM");
        printJson.println(total);
        printJson.close();
        System.out.println(total);

    }

    //when no presribed ID
    public static void putstuff(TransportClient c, String js, String index, String type){
        IndexResponse result = c.prepareIndex(index, type).setSource(js).get();
        System.out.println("putstuff");
        System.out.println(result);

    }
    //with Prescribed ID
    public static void putstuff(TransportClient c, String js, String index, String type, String ID) {
        IndexResponse result = c.prepareIndex(index, type, ID).setSource(js).get();
    }

    public static String[] getJsons(){
        String json[] = new String[5];
        json[0] = "{\"Breed\":\"Husky\",\"dateOfBirth\":2015,\"Name\":\"JackSparrow\"}"; //THIS IS THE SAME AS A 'curl -XPOST' command string
        json[1] = "{\"Breed\":\"Dobie\",\"dateOfBirth\":2011,\"Name\":\"Hannah Montannah\"}";
        json[2] = "{\"Breed\":\"Hound\",\"dateOfBirth\":2008,\"Name\":\"Donald Trump\"}";
        json[3] = "{\"Breed\":\"Retriever\",\"dateOfBirth\":2003,\"Name\":\"Barry Obama\"}";
        json[4] = "{\"Breed\":\"Pomeranian\",\"dateOfBirth\":2017,\"Name\":\"Chuck Schumer\"}";
        return json;
    }


    //search for 'value' in the field of 'keyword'; return all hits
    public static SearchResponse searchKeywordValue(TransportClient c, String index, String type, String keyword, String value){
        SearchResponse results;
        //System.out.println("SEARCHING");
        results = c.prepareSearch(index)
                .setTypes(type)
                .setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
                .setQuery(QueryBuilders.matchQuery(keyword, value))
                //.setQuery(QueryBuilders.multiMatchQuery(value, "_all"))
                .setFrom(0).setSize(60).setExplain(true)
                .get();


        SearchHit[] hits = results.getHits().getHits();
        String total = "";
        for(SearchHit hit : hits) {
            total += hit.getSourceAsString();
            total += "\n";
        }

        System.out.println(total);
        return results;
    }



    public static SearchResponse searchKeywordValue(TransportClient c){
        SearchResponse results;
        System.out.println("MATCH ALL");
        results = c.prepareSearch()
                .setTypes()
                .setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
                //.setQuery(QueryBuilders.matchQuery(value))
                //.setQuery(QueryBuilders.multiMatchQuery(value, "_all"))
                .setQuery(QueryBuilders.matchAllQuery())
                .setQuery(QueryBuilders.existsQuery("_all"))
                .setFrom(0).setSize(60).setExplain(true)
                .get();


        SearchHit[] hits = results.getHits().getHits();
        String total = "";
        for(SearchHit hit : hits) {
            System.out.println(hit.getFields().get(0));
            total += hit.getSourceAsString();
            total += "\n";
        }
        System.out.println("PRINT FIELDS");
        hits[0].getFields();
        //System.out.println(total);
        return results;
    }



    public static SearchResponse searchKeywordValue(TransportClient c, String value){
        SearchResponse results;
        //System.out.println("SEARCHING");
        results = c.prepareSearch()
                .setTypes()
                .setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
                //.setQuery(QueryBuilders.matchQuery(value))
                .setQuery(QueryBuilders.multiMatchQuery(value, "_all"))
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
        return results;
    }






    //search for a value between 'min' and 'max' in field 'keyword'
    public static SearchResponse searchRange(TransportClient c, String index, String type, String keyword, int min, int max){
        SearchResponse results;
        results = c.prepareSearch(index)
                .setTypes(type)
                .setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
                .setPostFilter(QueryBuilders.rangeQuery(keyword).from(min).to(max))
                .setFrom(0).setSize(60).setExplain(true)
                .get();

        return results;
    }

}