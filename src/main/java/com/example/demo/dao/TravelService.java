package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Account;
import com.example.demo.model.Bucket;
import com.example.demo.model.Notice;
import com.example.demo.model.Plan;
import com.example.demo.model.Question;


public interface TravelService {
	//로그인,가입,아이디,비번찾기
	Account getAccount (HashMap<String, Object> map) throws Exception; 
	List<Account> selectIdList(HashMap<String, Object> map) throws Exception; 
	int addUserid(HashMap<String, Object> map) throws Exception;
	String findUserId(HashMap<String, Object> map) throws Exception;
	String findUserPw(HashMap<String, Object> map) throws Exception;
	int modifyUserPw(HashMap<String, Object> map) throws Exception;
	String checkUserid(HashMap<String, Object> map) throws Exception;
	List<Account> checkUserNick(HashMap<String, Object> map) throws Exception;
	int checkUserEmail(HashMap<String, Object> map) throws Exception;
	List<Account> getProimg(HashMap<String, Object> map) throws Exception; 
	void updatePro(HashMap<String, Object> map);
	void updatePro2(HashMap<String, Object> map);
	//공지사항관련
	List<Notice> selectNoticeList(HashMap<String, Object> map) throws Exception;
	//List<Notice> selectNoticesearch(HashMap<String, Object> map) throws Exception;
	int selectNoticeCnt();
	HashMap<String, Object> getNotice(HashMap<String, Object> map) throws Exception;
	int addNotice(HashMap<String, Object> map) throws Exception;
	void editNotice(HashMap<String, Object> map) throws Exception;
	int delNotice(HashMap<String, Object> map) throws Exception;

	//문의글관련
	List<Question> getContactList (HashMap<String, Object> map) throws Exception;
	List<Question> getAdminContactList (HashMap<String, Object> map) throws Exception;
	int getContactListCnt(HashMap<String, Object> map);
	int getadminContactListCnt();
	int creatContact(HashMap<String, Object> map) throws Exception; 
	int delContact(HashMap<String, Object> map) throws Exception; 
	int admindelContact(HashMap<String, Object> map) throws Exception; 
	void editqContact(HashMap<String, Object> map);
	HashMap<String, Object> selectContact(HashMap<String, Object> map) throws Exception; 
	HashMap<String, Object> adminSelectContact(HashMap<String, Object> map) throws Exception;
	int adminCommentContact(HashMap<String, Object> map) throws Exception;
	
	//버킷리스트 관련
	int addBucketList(HashMap<String, Object> map) throws Exception;
	//버킷리스트 찜한것 가져오기
	List<Bucket> getBucketList(HashMap<String,Object> map) throws Exception;
	
	void addPlan(HashMap<String, Object> map);
	void addPlan1(HashMap<String, Object> map);
	List<Plan> getMyplanner(HashMap<String,Object> map) throws Exception;
	List<Plan> getDate(HashMap<String,Object> map) throws Exception;
}
