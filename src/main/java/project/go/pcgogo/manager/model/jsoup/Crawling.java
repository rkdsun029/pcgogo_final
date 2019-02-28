package project.go.pcgogo.manager.model.jsoup;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawling {
	
	public static void main(String[] args) {
		
	}
	
	public List<String> crawling2() {
		List<String> result = new ArrayList<>();
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
			System.out.println(e.text());	
			result.add(e.text());
			System.out.println("------------------------------------------");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		

		return result;
	}
}
