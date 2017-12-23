package com.mid.inter;

import java.util.ArrayList;

import com.mid.dto.FaqDTO;
import com.mid.dto.QnaCommentDTO;
import com.mid.dto.QnaTypeDTO;
import com.mid.dto.ServiceDTO;
import com.mid.dto.TmDTO;

public interface IServiceDAO
{
	public ArrayList<FaqDTO> faqList();
	public ArrayList<TmDTO> tmList();
	public ArrayList<ServiceDTO> list();
	public int count();
	public ArrayList<ServiceDTO> qnaResearch(String key);
	public ServiceDTO qnaContent(String qna_id);
	public void qnaCommentInsert(QnaCommentDTO dto);
	public QnaCommentDTO qnaComment(String qna_id);
	public int qnaContentState(String qna_id);
	public ArrayList<QnaTypeDTO> qnaTypeList();
	public void qnaInsert(ServiceDTO dto);
	public void qnaDelete(String qna_id);
}
