package web.portfolio.domain;

import java.io.File;
import java.util.List;

public class FileVO {
	private Integer fno;
	private String filename;
	private String path;
	private String isdir;
	
	
	
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
	public String getIsdir() {
		return isdir;
	}
	public void setIsdir(String isdir) {
		this.isdir = isdir;
	}
	
	
	
	@Override
	public String toString() {
		return "FileVO [fno=" + fno + ", filename=" + filename + ", path=" + path + ", isdir=" + isdir + "]";
	}
	
	
	
    

	
	
	

}
