package faq.dao;

import java.util.List;

import faq.vo.FaqVO;
import util.MyBatisDAO;

public class FaqDAOImpl extends MyBatisDAO implements IFaqDAO {

	private static IFaqDAO faqDao;
	
	private FaqDAOImpl() {
		
	}
	
	public static IFaqDAO getInstance() {
		if(faqDao == null) {
			faqDao = new FaqDAOImpl();
		}
		return faqDao;
	}

	@Override
	public int insertFaq(FaqVO fv) {
		return insert("faq.insertFaq", fv);
	}

	@Override
	public int updateFaq(FaqVO fv) {
		return update("faq.updateFaq", fv);
	}

	@Override
	public int deleteFaq(String faqId) {
		return delete("faq.deleterFaq", faqId);
	}

	@Override
	public List<FaqVO> listAllFaq() {
		List<FaqVO> faqList = selectList("faq.listAllFaq");
		return faqList;
	}

	@Override
	public FaqVO getFAQ(String faqId) {
		return selectOne("faq.getFAQ", faqId);
	}


	
}
