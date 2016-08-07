package com.wenban.bbs.service;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wenban.bbs.dao.TopicDAO;
import com.wenban.bbs.model.Topic;

@Service
public class TopicService {
	@Autowired
	private TopicDAO deletedao;
	@Autowired
	private TopicDAO selectdao;
	@Autowired
	private TopicDAO selectonedaobyname;
	@Autowired
	private TopicDAO selectonedao;
	@Autowired
	private TopicDAO selectalldao;
	@Autowired
	private TopicDAO adddao;

	public void deleteTopicById(Integer id) {
		deletedao.deleteTopicById(id);
	}

	public Topic selectOneTopic(Integer id) {
		return selectonedao.selectOneTopic(id);
	}
	
	public List<Topic> selectTopicListByTopicname(Topic topic) {
		return selectonedaobyname.selectTopicListByTopicname(topic);
	}

	public List<Topic> selectTopicList(Integer id) {
		List<Topic> topiclist = selectdao.selectTopicList(id);
		for (int i = 0; i < topiclist.size(); i++) {
			String descs = topiclist.get(i).getDescs();
			Document doc = Jsoup.parse(descs);
			String imagdir = "/upload/default.jpg";
			if (!doc.select("img").isEmpty()) {
				Element eleimg = doc.select("img").first();
				imagdir = eleimg.attr("src");
			}
			topiclist.get(i).setImagDir(imagdir);
		}
		return topiclist;
	}

	public List<Topic> selectChildTopicList(Integer id) {
		List<Topic> topiclist = selectdao.selectChildTopicList(id);
		for (int i = 0; i < topiclist.size(); i++) {
			String descs = topiclist.get(i).getDescs();
			Document doc = Jsoup.parse(descs);
			String imagdir = "/upload/default.jpg";
			if (!doc.select("img").isEmpty()) {
				Element eleimg = doc.select("img").first();
				imagdir = eleimg.attr("src");
			}
			topiclist.get(i).setImagDir(imagdir);
		}
		return topiclist;
	}

	public List<Topic> selectalltopic() {
		List<Topic> topiclist = selectalldao.selectalltopic();
		for (int i = 0; i < topiclist.size(); i++) {
			String descs = topiclist.get(i).getDescs();
			Document doc = Jsoup.parse(descs);
			String imagdir = "/upload/default.jpg";
			if (!doc.select("img").isEmpty()) {
				Element eleimg = doc.select("img").first();
				imagdir = eleimg.attr("src");
			}
			topiclist.get(i).setImagDir(imagdir);
		}
		return topiclist;
	}

	public void insertIntoTopic(Topic topic) {
		String descs = topic.getDescs();
		Document doc = Jsoup.parse(descs);
		Element img = doc.select("img").first();
		String imgdir = img.attr("src");
		System.out.println(imgdir);
		topic.setImagDir(imgdir);
		String text = doc.body().text();
		topic.setSummary(text.substring(0, 100) + "……");
		adddao.insertIntoTopic(topic);
	}
}
