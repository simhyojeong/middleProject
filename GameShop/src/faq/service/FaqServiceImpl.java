package faq.service;

import java.util.List;

import faq.dao.FaqDAOImpl;
import faq.dao.IFaqDAO;
import faq.vo.FaqVO;

public class FaqServiceImpl implements IFaqService {

	private static IFaqService faqService;
	
	private IFaqDAO faqDao;
	
	private FaqServiceImpl() {
		faqDao = FaqDAOImpl.getInstance();
		}
	
	public static IFaqService getInstance() {
		if(faqService == null) {
			faqService = new FaqServiceImpl();
		}
		return faqService;
	}

	@Override
	public int insertFaq(FaqVO fv) {
		return faqDao.insertFaq(fv);
	}

	@Override
	public int updateFaq(FaqVO fv) {
		return faqDao.updateFaq(fv);
	}

	@Override
	public int deleteFaq(String faqId) {
		return faqDao.deleteFaq(faqId);
	}

	@Override
	public List<FaqVO> listAllFaq() {
		return faqDao.listAllFaq();
	}

	@Override
	public FaqVO getFAQ(String faqId) {
		return faqDao.getFAQ(faqId);
	}
}
