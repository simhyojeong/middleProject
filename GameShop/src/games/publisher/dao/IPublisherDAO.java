package games.publisher.dao;

import games.publisher.vo.PublishVO;
import games.publisher.vo.PublisherVO;
import java.util.List;

public interface IPublisherDAO {
	int insertPublisher(String var1);

	int insertPublish(PublishVO var1);

	String nextPubId();

	String isPubId(String var1);

	void updatePublisher(PublisherVO var1);

	void updatePublish(PublishVO var1);

	void deletePublish(String var1);

	List<PublisherVO> allPubList();
}
