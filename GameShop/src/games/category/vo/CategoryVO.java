package games.category.vo;

public class CategoryVO {
    private String detailId;
    private String cateId;
    private String detailName;

    public CategoryVO() {
    }

    public String getDetailId() {
        return this.detailId;
    }

    public void setDetailId(String detailId) {
        this.detailId = detailId;
    }

    public String getCateId() {
        return this.cateId;
    }

    public void setCateId(String cateId) {
        this.cateId = cateId;
    }

    public String getDetailName() {
        return this.detailName;
    }

    public void setDetailName(String detailName) {
        this.detailName = detailName;
    }
}
