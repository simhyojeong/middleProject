package games.publisher.dao;

import games.publisher.vo.PublishVO;
import games.publisher.vo.PublisherVO;
import java.util.List;
import util.MyBatisDAO;

public class PublisherDAOImpl extends MyBatisDAO implements IPublisherDAO {
    private static IPublisherDAO dao;

    public PublisherDAOImpl() {
    }

    public static IPublisherDAO getInstance() {
        if (dao == null) {
            dao = new PublisherDAOImpl();
        }

        return dao;
    }

    public int insertPublisher(String pubName) {
        return this.insert("publisher.insertPublisher", pubName);
    }

    public int insertPublish(PublishVO publishVo) {
        return this.insert("publisher.insertPublish", publishVo);
    }

    public String nextPubId() {
        return (String)this.selectOne("publisher.nextPubId");
    }

    public String isPubId(String pubName) {
        return (String)this.selectOne("publisher.isPubId", pubName);
    }

    public void updatePublisher(PublisherVO publisherVo) {
        this.update("publisher.updatePublisher", publisherVo);
    }

    public void updatePublish(PublishVO publishVo) {
        this.update("publisher.updatePublish", publishVo);
    }

    public void deletePublish(String gameId) {
        this.delete("publisher.deletePublish", gameId);
    }

    public List<PublisherVO> allPubList() {
        List<PublisherVO> publisher = this.selectList("publisher.allPubList");
        return publisher;
    }
}
