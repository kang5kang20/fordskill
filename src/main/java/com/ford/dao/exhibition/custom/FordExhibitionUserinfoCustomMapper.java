package com.ford.dao.exhibition.custom;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("fordExhibitionUserinfoCustomMapper")
public interface FordExhibitionUserinfoCustomMapper {

    int updateUserWin(Map<String, Object>map);
    
}