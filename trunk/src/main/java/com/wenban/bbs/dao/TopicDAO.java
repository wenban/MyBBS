package com.wenban.bbs.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.wenban.bbs.model.Topic;

@Repository
public interface TopicDAO {
	public Topic selectOneTopic(Integer id);
	public List<Topic> selectTopicList(Integer id);
	public List<Topic> selectChildTopicList(Integer id);
	public List<Topic> selectTopicListByTopicname(Topic topic);
	public List<Topic> selectalltopic();
	public Integer deleteTopicById(Integer id);
	public Integer insertIntoTopic(Topic topic);
}