package dao;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class just {

	public static void main(String[] args) {
		HttpRequest request = HttpRequest.newBuilder()
				.uri(URI.create("https://heisenbug-premier-league-live-scores-v1.p.rapidapi.com/api/premierleague?team1=Leeds"))
				.header("x-rapidapi-key", "3fb0e2ffb0msh091247651585061p1ddfe3jsn1a702eb6c8a6")
				.header("x-rapidapi-host", "heisenbug-premier-league-live-scores-v1.p.rapidapi.com")
				.method("GET", HttpRequest.BodyPublishers.noBody())
				.build();
		
		try {
				try {
					HttpResponse<String> response;
					response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
					
					String leagueMatch = (String) response.body();
					// System.out.println(leagueMatch);
					
					JSONParser jsonParser = new JSONParser();     
					JSONObject jsonObj;

					jsonObj = (JSONObject) jsonParser.parse(leagueMatch);
					JSONArray matchArray = (JSONArray) jsonObj.get("matches");
					
		        	for(int i = 0 ; i < matchArray.size() ; i++){
		        		JSONObject tempObj = (JSONObject) matchArray.get(i);
		                System.out.println(tempObj.get("when"));	                
		                System.out.println(tempObj.get("referee"));
		                System.out.println(tempObj.get("matchNumber"));
		                
		                JSONObject testDataObject = (JSONObject) tempObj.get("team1");
		                System.out.println(testDataObject.get("teamName"));
		                System.out.println(testDataObject.get("teamScore"));
		                System.out.println(testDataObject.get("firstHalfScore"));
		                
		                JSONObject testDataObject2 = (JSONObject) tempObj.get("team2");
		                System.out.println(testDataObject2.get("teamName"));
		                System.out.println(testDataObject2.get("teamScore"));
		                System.out.println(testDataObject2.get("firstHalfScore"));
		         
		        	} 
					
					matchArray.forEach( match -> parseTestData( (JSONObject) match ) );
					
				} catch (IOException | InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				} catch (ParseException e) {
					e.printStackTrace();
		        
				}
		    
		}
	
    private static void parseTestData(JSONObject match) {
    	
        JSONObject testDataObject = (JSONObject) match.get("team1"); 
        
        String team1Name = String.valueOf(testDataObject.get("teamName"));
        String team1Score = String.valueOf(testDataObject.get("teamScore"));;        
        String team1FirstHalfScore = String.valueOf(testDataObject.get("firstHalfScore"));
        
        System.out.println(team1Name);
        System.out.println(team1Score);
        System.out.println(team1FirstHalfScore);
         
        JSONObject testDataObject2 = (JSONObject) match.get("team2");  
        String team2Name = String.valueOf(testDataObject2.get("teamName"));
        String team2Score= String.valueOf(testDataObject2.get("teamScore")); 
        String team2FirstHalfScore = String.valueOf(testDataObject2.get("firstHalfScore"));
        System.out.println(team2Name);
        System.out.println(team2Score);
        System.out.println(team2FirstHalfScore);

    }
}
