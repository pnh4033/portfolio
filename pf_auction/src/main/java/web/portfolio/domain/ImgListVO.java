package web.portfolio.domain;

import java.util.List;

public class ImgListVO {
	
	private List<String> imgList;

	public List<String> getImgList() {
		return imgList;
	}

	public void setImgList(List<String> imgList) {
		this.imgList = imgList;
	}

	@Override
	public String toString() {
		return "ImgListVO [imgList=" + imgList + "]";
	}
	
	

}
