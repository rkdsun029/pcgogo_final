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

public class CrawlingTest {

	public static void main(String[] args) {

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
		
	
		
		for(Element el : element3.select("li")) {
			String title = el.getElementsByTag("a").text();
			String aTag = el.getElementsByTag("a").attr("href");
			System.out.println("======================================");
			System.out.printf("title = "+title);
			System.out.printf("aTag = "+aTag);
			System.out.println("======================================");
		}
		
	}

	

}
