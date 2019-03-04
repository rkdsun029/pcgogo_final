package project.go.pcgogo.lostandfound.model.service;

import java.util.List;
import java.util.Map;

import project.go.pcgogo.lostandfound.model.vo.Attachment;
import project.go.pcgogo.lostandfound.model.vo.LostAndFound;

public interface LofService {

	List<Map<String, String>> selectlnfList(int cPage, int numPerPage); /*페이징된리스트*/

	int selectlnfTotalContents(); //전체 게시글 갯수 카운트

	List<LostAndFound> selectlnfListType(String no); //분류별로

	int selectlnfSelectContents(String no); //select된 게시글 갯수 카운트 2019-02-20

	List<LostAndFound> selectLnfNameList(String lnfName);

	int selectLnfNameCount(String lnfName);

	List<Map<String, String>> selectViewList(int no);

	int insertBoard(LostAndFound lostandfound, List<Attachment> attachList);

	List<Map<String, String>> selectViewImgList(int no);

	int updateDev(LostAndFound lostandfound);

	int deleteDev(int lnfNo);

	int completeDev(LostAndFound lostandfound);





}
