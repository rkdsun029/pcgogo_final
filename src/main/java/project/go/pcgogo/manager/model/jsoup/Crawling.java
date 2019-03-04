package project.go.pcgogo.manager.model.jsoup;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawling {
	
	public static void main(String[] args) {
		Crawling c = new Crawling();
		
		c.Crawling2();
		
	}
	
	
	
	public List<Map<String, String>> Crawling2() {
		List<Map<String, String>> result = new ArrayList<>();
		try {
			Document doc = Jsoup.connect("http://www.danawa.com").get();
			
			Elements hotdeal = doc.select(".main_middle_content ul");
			
			Elements deal = hotdeal.select("li");
			/*
			 * for(Element e : deal) { // System.out.println(e.getAllElements().toString());
			 * System.out.println(e.getElementsByAttributeValue("class",
			 * "goodds_name").text());
			 * System.out.println("------------------------------------------"); }
			 */
			for(Element e : deal) {
				String goodds_name = e.getElementsByAttributeValue("class","goodds_name").text();
				String price_type1 = e.getElementsByAttributeValue("class","price_type1").text();
				Map<String, String> map = new HashMap<>();
				map.put("goodds_name", goodds_name);
				map.put("price_type1", price_type1);
				System.out.println(map);
				System.out.println("------------------------------------------"); 
				result.add(map);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		

		return result;
	}
}
