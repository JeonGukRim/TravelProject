package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.TravelMapper;
import com.example.demo.model.Account;
import com.example.demo.model.Bucket;
import com.example.demo.model.Notice;
import com.example.demo.model.Plan;
import com.example.demo.model.Question;


@Service // 서비스임을 선언
public class TravelServiceImpl implements TravelService {

	@Autowired // Mapper와 연결
	private TravelMapper travelMapper;

	// 인터페이스 구체화
	@Override
	public Account getAccount(HashMap<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return travelMapper.getAccount(map); // db를 호출하는 mapper와 연결
	}
	@Override
	public List<Account> getProimg(HashMap<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return travelMapper.getProimg(map); // db를 호출하는 mapper와 연결
	}
	
	@Override
	public List<Plan> getMyplanner(HashMap<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return travelMapper.getMyplanner(map); // db를 호출하는 mapper와 연결
	}
	@Override
	public List<Plan> getDate(HashMap<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return travelMapper.getDate(map); // db를 호출하는 mapper와 연결
	}
	
	// 로그인정보
	@Override
	public List<Account> selectIdList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return travelMapper.selectIdList(map);
	}

	@Override
	public int addUserid(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return travelMapper.addUserid(map);
	}
	
	@Override
	public String findUserId(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return travelMapper.findUserId(map);
	}

	@Override
	public String findUserPw(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return travelMapper.findUserPw(map);
	}
	
	@Override
	public int modifyUserPw(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return travelMapper.modifyUserPw(map);
	}
	
	// 아이디 중복체크
	@Override
	public String checkUserid(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return travelMapper.checkUserid(map);
	}
	
	// 닉네임 중복체크
	@Override
	public List<Account> checkUserNick(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return travelMapper.checkUserNick(map);
	}
	
	// 이메일 중복체크
	@Override
	public int checkUserEmail(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return travelMapper.checkUserEmail(map);
	}

	// 공지사항 목록
	@Override
	public List<Notice> selectNoticeList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return travelMapper.selectNoticeList(map);
	}

	/*
	 * @Override public List<Notice> selectNoticesearch(HashMap<String, Object> map)
	 * throws Exception { // TODO Auto-generated method stub return
	 * travelMapper.selectNoticesearch(map); }
	 */
	@Override
	public int selectNoticeCnt() {
		return travelMapper.selectNoticeCnt();
	}

	// 공지사항 클릭조회
	@Override
	public HashMap<String, Object> getNotice(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		travelMapper.updateViewcount(map);
		// List<Notice> commentList = boardMapper.selectCommentList(map);
		Notice notice = travelMapper.getNotice(map);
		// resultMap.put("commentList", commentList);
		resultMap.put("notice", notice);
		return resultMap;
	}

	// 공지사항 작성
	@Override
	public int addNotice(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return travelMapper.addNotice(map);
	}

	// 공지사항 편집
	@Override
	public void editNotice(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		 travelMapper.editNotice(map);
	}

	// 공지사항 삭제
	@Override
	public int delNotice(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return travelMapper.delNotice(map);
	}
	// 문의글 리스트
	@Override
	public List<Question> getContactList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return travelMapper.getContactList(map);
	}
	// 관리자 문의글 리스트
	@Override
	public List<Question> getAdminContactList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return travelMapper.getAdminContactList(map);
	}
	
	@Override
	public int getContactListCnt(HashMap<String, Object> map){
		return travelMapper.getContactListCnt(map) ;
	}
	@Override
	public int getadminContactListCnt(){
		return travelMapper.getadminContactListCnt() ;
	}

	
	// 문의글 작성
	@Override
	public int creatContact(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return travelMapper.creatContact(map);
	}

	// 문의글 삭제
	@Override
	public int delContact(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
			return travelMapper.delContact(map);
	}
	
	@Override
	public int admindelContact(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
			return travelMapper.admindelContact(map);
	}

	// 문의글 회신
	@Override
	public int adminCommentContact(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return travelMapper.adminCommentContact(map);
	}

	// 문의글 선택
	@Override
	public HashMap<String, Object> selectContact(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Question question = travelMapper.selectContact(map);
		resultMap.put("question", question);
		return resultMap;
	}
	
	// 관리자 문의글 선택
	@Override
	public HashMap<String, Object> adminSelectContact(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Question question = travelMapper.adminSelectContact(map);
		resultMap.put("question", question);
		return resultMap;
	}
	
	//문의글 수정
	@Override
	public void editqContact(HashMap<String, Object> map) {
		travelMapper.editqContact(map);
	}
	//프로필 이미지 삽입
	@Override
	public void updatePro(HashMap<String, Object> map) {
		travelMapper.updatePro(map);
	}
	@Override
	public void updatePro2(HashMap<String, Object> map) {
		travelMapper.updatePro2(map);
	}
	//버킷리스트
	@Override
	public int addBucketList(HashMap<String, Object> map) throws Exception {
		int num;
		int bucketlistCheck = travelMapper.checkBucketList(map);
		if(bucketlistCheck == 0) {
			num = 1;
			travelMapper.addBucketList(map);
		}else {
			num = 0;
			travelMapper.removeBucketList(map);
		}
		return num;
	}
	//버킷리스트 찜한것 가져오기
	@Override
	public List<Bucket> getBucketList(HashMap<String,Object> map) throws Exception{
		return travelMapper.getBucketList(map);
	}
	@Override
	public void addPlan(HashMap<String, Object> map) {
		travelMapper.addPlan(map);
	}
	@Override
	public void addPlan1(HashMap<String, Object> map) {
		travelMapper.addPlan1(map);
	}
}