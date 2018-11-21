package com.ford.service.exhibition;

import java.util.Map;

import com.ford.entity.exhibition.FordExhibitionUserinfo;

import oracle.net.aso.e;

public interface IFordExhUserinfoService {
	
	
	public int addUserinfo(FordExhibitionUserinfo fordExhibitionUserinfo)throws Exception;

	public int updateUserinfoWinByKey(Map<String, Object> map)throws Exception;
	
}
