package games.publisher.service;

import games.publisher.dao.IPublisherDAO;
import games.publisher.dao.PublisherDAOImpl;
import games.publisher.vo.PublishVO;
import games.publisher.vo.PublisherVO;
import java.util.List;

public class PublisherServiceImpl implements IPublisherService {
    private static IPublisherService service;
    private IPublisherDAO dao = PublisherDAOImpl.getInstance();

    private PublisherServiceImpl() {
    }

    public static IPublisherService getInstance() {
        if (service == null) {
            service = new PublisherServiceImpl();
        }

        return service;
    }

    public int insertPublisher(String pubName) {
        return this.dao.insertPublisher(pubName);
    }

    public int insertPublish(PublishVO publishVo) {
        return this.dao.insertPublish(publishVo);
    }

    public String nextPubId() {
        return this.dao.nextPubId();
    }

    public String isPubId(String pubName) {
        return this.dao.isPubId(pubName);
    }

    public void updatePublisher(PublisherVO publisherVo) {
        this.dao.updatePublisher(publisherVo);
    }

    public void updatePublish(PublishVO publishVo) {
        this.dao.updatePublish(publishVo);
    }

    public void deletePublish(String gameId) {
        this.dao.deletePublish(gameId);
    }

    public List<PublisherVO> allPubList() {
        return this.dao.allPubList();
    }
}
