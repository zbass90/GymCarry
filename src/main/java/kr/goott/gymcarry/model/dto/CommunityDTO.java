
package kr.goott.gymcarry.model.dto;

import java.sql.Date;

public class CommunityDTO {
	private int comNo;
	private String userid;
	private String comImage;
	private String comDes;
	private int views;
	private int likes;
	private int replys;
	private Date regdate;
	
	
	public CommunityDTO() {
		
	}
	public CommunityDTO(int comNo,String userid,String comImage, String comDes, int views,int likes,int replys) {
		this.comNo= comNo;
		this.userid = userid;
		this.comImage = comImage;
		this.comDes = comDes;
		this.views = views;
		this.likes = likes;
		this.replys = replys;		
		
	}
	
	
	
	

	@Override
	public String toString() {
		return "CommunityDTO [comNo=" + comNo + ", userid=" + userid + ", comImage=" + comImage + ", comDes=" + comDes
				+ ", views=" + views + ", likes=" + likes + ", replys=" + replys + ", regdate=" + regdate + "]";
	}



	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getComImage() {
		return comImage;
	}

	public void setComImage(String comImage) {
		this.comImage = comImage;
	}

	public String getComDes() {
		return comDes;
	}

	public void setComDes(String comDes) {
		this.comDes = comDes;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getReplys() {
		return replys;
	}

	public void setReplys(int replys) {
		this.replys = replys;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	
	
	
}