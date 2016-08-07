package com.wenban.bbs.dao;

import org.springframework.stereotype.Repository;
import com.wenban.bbs.model.Reply;

@Repository
public interface ReplyDAO {
	public Integer insertIntoReply(Reply reply);
}
