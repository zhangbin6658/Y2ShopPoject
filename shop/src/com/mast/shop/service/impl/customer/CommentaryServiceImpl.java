package com.mast.shop.service.impl.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mast.shop.bean.customer.Commentary;
import com.mast.shop.dao.customer.CommentaryDao;
import com.mast.shop.service.customer.CommentaryService;
@Service("commentaryService")
public class CommentaryServiceImpl implements CommentaryService{
	@Autowired
	private CommentaryDao commentaryDao;
	@Override
	public int saveCommentary(Commentary comment) {
		return commentaryDao.saveCommentary(comment);
	}
	@Override
	public List<Commentary> listCommentByCid(String nickName) {
		return commentaryDao.listCommentByCid(nickName);
	}
	@Override
	public List<Commentary> listComment() {
		return commentaryDao.listComment();
	}
}
