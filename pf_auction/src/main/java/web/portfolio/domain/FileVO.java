package web.portfolio.domain;

import java.io.File;
import java.util.List;

public class FileVO {
	private Integer fno;
	private String filename;
	private Boolean first=true;
	private String path;
	private String isdir;
	private List<FileVO> presentList;
	
	public List<FileVO> getPresentList() {
		return presentList;
	}
	public void setPresentList(List<FileVO> presentList) {
		this.presentList = presentList;
	}
	public String getIsdir() {
		return isdir;
	}
	public void setIsdir(String isdir) {
		this.isdir = isdir;
	}
	public Boolean getFirst() {
		return first;
	}
	public void setFirst(Boolean first) {
		this.first = first;
	}

	public Integer getFno() {
		return fno;
	}
	public void setFno(Integer fno) {
		this.fno = fno;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
	@Override
	public String toString() {
		return "FileVO [fno=" + fno + ", filename=" + filename + ", path=" + path + "]";
	}
	
	
	

}
