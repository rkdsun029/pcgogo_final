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

import oracle.net.aso.e;

public class Crawling {
	
	public static void main(String[] args) {
		Crawling c = new Crawling();
		
		c.Crawling_hotDeal();
		c.Crawling_bigNews();
		
		
	}
//	
//	public List<Map<String, String>> Crawling_hotDeal() {
//		List<Map<String, String>> result = new ArrayList<>();
//		try {
//			Document doc = Jsoup.connect("http://www.danawa.com").get();
//			
//			Elements hotdeal = doc.select(".main_middle_content ul");
//			
//			Elements deal = hotdeal.select("li");
//			/*
//			 * for(Element e : deal) { // System.out.println(e.getAllElements().toString());
//			 * System.out.println(e.getElementsByAttributeValue("class",
//			 * "goodds_name").text());
//			 * System.out.println("------------------------------------------"); }
//			 */
//			for(Element e : deal) {
//				String goodds_name = e.getElementsByAttributeValue("class","goodds_name").text();
//				String price_type1 = e.getElementsByAttributeValue("class","price_type1").text();
//				Map<String, String> map = new HashMap<>();
//				map.put("goodds_name", goodds_name);
//				map.put("price_type1", price_type1);
//				System.out.println(map);
//				System.out.println("------------------------------------------"); 
//				result.add(map);
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//
//		return result;
//	}
	public List<Map<String, String>> Crawling_hotDeal() {
		List<Map<String, String>> result = new ArrayList<>();
		
		String url = "https://www.lightinthebox.com/ko/c/%EC%BB%B4%ED%93%A8%ED%84%B0-%EB%B6%80%ED%92%88_851";
		Document doc = null;
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//주요 뉴스로 나오는 태그를 찾아서 가져오도록 한다.
		Elements element = doc.select(".pagelet");
		Elements element2 = element.select(".widget"); 
		Elements element3 = element2.select("div"); 
		
		//1. 헤더 부분의 제목을 가져온다.
//		String title = element2.select("dl").text(); //IT관련 핫뉴그 제목 TOP10 긁어오기
		
		/*제목 top10 포문*/
		for(Element el : element3.select("dl")) {
			String title = el.getElementsByAttributeValue("class", "prod-name").text();
			String originalPrice = el.getElementsByAttributeValue("class", "list-price").text();
			String aTag = el.getElementsByTag("a").attr("href");
			String salePrice = el.getElementsByAttributeValue("class", "price ctr-track").text();
			Map<String, String> map = new HashMap<>();
			//찍어보기
			map.put("title", title);
			map.put("originalPrice", originalPrice);
			map.put("salePrice", salePrice);
			map.put("aTag", aTag);
			System.out.println(map);
			System.out.println("------------------------------------------"); 
			result.add(map);
		}
		return result;
	}
	
	/*타이틀 따오기*/
	public List<Map<String, String>> Crawling_bigNews() {
		List<Map<String, String>> news = new ArrayList<>();
		
		String url = "https://news.naver.com/";
		
		Document doc = null;
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//주요 뉴스로 나오는 태그를 찾아서 가져오도록 한다.
		Elements element = doc.select("#ranking_105");
		Elements element2 = element.select(".section_list_ranking"); 
		
		//1. 헤더 부분의 제목을 가져온다.
		 //IT관련 핫뉴그 제목 TOP10 긁어오기
		String title = element2.select("ul").text();
		
		/*제목 top10 포문*/
		for(Element el : element2.select("li")) {
			String hotTitle = el.getElementsByTag("a").text();
			String aTag = el.getElementsByTag("a").attr("href");
			Map<String, String> map = new HashMap<>();
			//찍어보기
			map.put("hotTitle", hotTitle);
			map.put("aTag", aTag);
			System.out.println(map);
			System.out.println("------------------------------------------"); 
			news.add(map);
		}
		return news;
    }
	
	
	
	public List<Map<String, String>> Crawling_gameNews() {
		List<Map<String, String>> news = new ArrayList<>();
		
		String url = "https://news.naver.com/main/list.nhn?mode=LS2D&mid=shm&sid1=105&sid2=229";
		
		Document doc = null;
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//주요 뉴스로 나오는 태그를 찾아서 가져오도록 한다.
			Elements element = doc.select(".container");
			Elements element2 = element.select("#main_content"); 
			Elements element3 = element2.select("ul"); 
				
		
		/*제목 top10 포문*/
		for(Element el : element2.select("li")) {
			String title = el.getElementsByTag("a").text();
			String Tag = el.getElementsByTag("a").attr("href");
			Map<String, String> map = new HashMap<>();
			//찍어보기
			map.put("title", title);
			map.put("Tag", Tag);
			System.out.println(map);
			System.out.println("------------------------------------------"); 
			news.add(map);
		}
		return news;
    }

}
