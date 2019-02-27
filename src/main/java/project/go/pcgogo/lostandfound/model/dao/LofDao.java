package project.go.pcgogo.lostandfound.model.dao;

import java.util.List;
import java.util.Map;

import project.go.pcgogo.lostandfound.model.vo.Attachment;
import project.go.pcgogo.lostandfound.model.vo.LostAndFound;

public interface LofDao {

	List<Map<String, String>> selectlnfList(int cPage, int numPerPage);

	int selectlnfTotalContents();

	List<LostAndFound> selectlnfListType(String no);

	int selectlnfSelectContents(String no);

	List<LostAndFound> selectLnfNameList(String lnfName);

	int selectLnfNameCount(String lnfName);

	List<Map<String, String>> selectViewList(int no);	

	List<Map<String, String>> selectViewImgList(int no);

	int insertBoard(LostAndFound lostandfound);

	int insertAttachment(Attachment a);

	int completeDev(LostAndFound lostandfound);

	int deleteDev(int lnfNo);




}
