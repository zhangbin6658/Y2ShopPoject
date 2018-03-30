package com.mast.shop.service.customer;

import java.util.List;

import javax.xml.stream.events.Comment;

import com.mast.shop.bean.customer.Commentary;

/**
 * 评论
 * @author asus
 *
 */
public interface CommentaryService {
	/**
	 * 新增评论
	 * @param comment
	 * @return
	 */
	public int saveCommentary(Commentary comment);
	/**
	 * 根据nickName查看评论
	 */
	public List<Commentary>listCommentByCid(String nickName);
	
	public List<Commentary>listComment();
}
