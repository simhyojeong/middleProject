package faq.service;

import java.util.List;

import faq.vo.FaqVO;

public interface IFaqService {
	
	public int insertFaq(FaqVO fv);

	public int updateFaq(FaqVO fv);
	
	public int deleteFaq(String faqId);
	
	public List<FaqVO> listAllFaq();
	
	public FaqVO getFAQ(String faqId);
}
