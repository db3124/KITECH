package com.kite.mm.guest.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kite.mm.guest.dao.GuestDao;
import com.kite.mm.guest.domain.GuestArticleVo;

@Service
public class GuestViewService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private GuestDao dao;
	
	public GuestArticleVo getArticle(int idx) {
		
		dao = template.getMapper(GuestDao.class);
		
		return dao.selectGuestByIdx(idx) ;
		
	}

}
