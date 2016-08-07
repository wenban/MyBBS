package com.wenban.bbs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wenban.bbs.dao.ReplyDAO;
import com.wenban.bbs.model.Reply;

@Service
public class ReplyService {
	@Autowired
	private ReplyDAO replydao;

	public void insertIntoReply(Reply reply) {
		replydao.insertIntoReply(reply);
	}
}
