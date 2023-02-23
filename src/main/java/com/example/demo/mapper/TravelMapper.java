package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Account;
import com.example.demo.model.Bucket;
import com.example.demo.model.Notice;
import com.example.demo.model.Plan;
import com.example.demo.model.Question;


@Mapper
public interface TravelMapper {
	
	//로그인 정보 연결
	List<Account> selectIdList(HashMap<String, Object> map) throws Exception; 
	Account getAccount(HashMap<String, Object> map) throws Exception;
	//프로필 가져오기
	List<Account> getProimg(HashMap<String, Object> map) throws Exception; 
	//회원가입
	int addUserid(HashMap<String, Object> map) throws Exception; 
	//아이디찾기 비번찾기
	String findUserId(HashMap<String,Object> map) throws Exception; 
	String findUserPw(HashMap<String,Object> map) throws Exception;
	// 비번찾기 > 변경
	int modifyUserPw(HashMap<String, Object> map) throws Exception;
	// 아이디 중복체크
	String checkUserid(HashMap<String, Object> map) throws Exception;
	// 닉네임 중복체크
	List<Account> checkUserNick(HashMap<String, Object> map) throws Exception;
	// 이메일 중복체크
	int checkUserEmail(HashMap<String, Object> map) throws Exception;
	
	//공지사항 리스트
	List<Notice> selectNoticeList(HashMap<String,Object> map) throws Exception; 
	//List<Notice> selectNoticesearch(HashMap<String,Object> map) throws Exception; 
	int selectNoticeCnt(); 
	//공지사항 조회 유저,관리자 동일적용
	Notice getNotice(HashMap<String,Object> map) throws Exception; 
	void updateViewcount(HashMap<String, Object> map);
	//공지사항 작성
	int addNotice(HashMap<String, Object> map) throws Exception; 
	//공지사항 편집
	void editNotice(HashMap<String, Object> map) throws Exception; 
	//공지사항 삭제
	int delNotice(HashMap<String, Object> map) throws Exception; 
	
	//문의글 목록
	List<Question> getContactList(HashMap<String, Object> map) throws Exception;
	//관리자 문의글 목록
	List<Question> getAdminContactList(HashMap<String, Object> map) throws Exception; 
	int getContactListCnt(HashMap<String, Object> map); 
	int getadminContactListCnt(); 
	
	//문의글 선택
	Question selectContact(HashMap<String, Object> map) throws Exception;
	//관리자 문의글 선택
	Question adminSelectContact(HashMap<String, Object> map) throws Exception; 
	//문의글 수정
	void editqContact(HashMap<String, Object> map);
	//문의글 작성 
	int creatContact(HashMap<String, Object> map) throws Exception; 
	//문의글 삭제  관리자/유저	
	int delContact (HashMap<String, Object> map) throws Exception; 
	int admindelContact (HashMap<String, Object> map) throws Exception;
	//관리자 문의글 회신
	int adminCommentContact(HashMap<String, Object> map) throws Exception; 
	
	//프로필 이미지삽입
	void updatePro(HashMap<String, Object> map);
	void updatePro2(HashMap<String, Object> map);
	//버킷리스트
	int addBucketList(HashMap<String, Object> map) throws Exception;
	//버킷리스트 중복체크
	int checkBucketList(HashMap<String, Object> map) throws Exception;
	//버킷리스트 찜한것 가져오기
	List<Bucket> getBucketList(HashMap<String,Object> map) throws Exception;
	//버킷리스트 삭제
	int removeBucketList(HashMap<String, Object> map) throws Exception;
	void addPlan(HashMap<String, Object> map);
	void addPlan1(HashMap<String, Object> map);
	List<Plan> getMyplanner(HashMap<String,Object> map) throws Exception;
	List<Plan> getDate(HashMap<String,Object> map) throws Exception;
}
