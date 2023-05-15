package faq.dao;

import java.util.List;

import faq.vo.FaqVO;

/**
 * 실제 db와 연결해 sql문을 수행하여 결과를 받아 서비스에 전달하는  DAO인터페이스
 * @author jina
 *
 */
public interface IFaqDAO {

	public int insertFaq(FaqVO fv);

	public int updateFaq(FaqVO fv);
	
	public int deleteFaq(String faqId);
	
	public List<FaqVO> listAllFaq();
	
	
	public FaqVO getFAQ(String faqId);
}
