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
		
		c.Crawling_hotDeal();
		c.Crawling_bigNews();
		
	}
	
	
	
	public List<Map<String, String>> Crawling_hotDeal() {
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
	
	
	public List<Map<String, String>> Crawling_bigNews() {
		List<Map<String, String>> result = new ArrayList<>();
		try {
			Document doc = Jsoup.connect("http://game.donga.com/news/").get();
			
			Elements hotdeal = doc.select(".news newspaper ul#news");
			
			Elements deal = hotdeal.select("li");
			/*
			 * for(Element e : deal) { // System.out.println(e.getAllElements().toString());
			 * System.out.println(e.getElementsByAttributeValue("class",
			 * "goodds_name").text());
			 * System.out.println("------------------------------------------"); }
			 */
			for(Element e : deal) {
				String newsLine = e.getElementsByAttribute("strong").text();
				
				Map<String, String> map = new HashMap<>();
				map.put("newsLine", newsLine);
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
