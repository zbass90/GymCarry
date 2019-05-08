package kr.goott.gymcarry.model.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommunityReplyDTO {
	private int replyNo;
	private String userid;
	private String replyDes;
	private String regdate;
	private int comNo;
	private String userimage;

	

	@Override
	public String toString() {
		return "CommunityReplyDTO [replyNo=" + replyNo + ", userid=" + userid + ", replyDes=" + replyDes + ", regdate="
				+ regdate + ", comNo=" + comNo + ", userimage=" + userimage + "]";
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getReplyDes() {
		return replyDes;
	}
	public void setReplyDes(String replyDes) {
		this.replyDes = replyDes;
	}


	public String getRegdate() {
		int year = Integer.parseInt(regdate.substring(0,4));
		int month = Integer.parseInt(regdate.substring(5,7));
		int day = Integer.parseInt(regdate.substring(8,10));
		
		Date date = new Date();
		SimpleDateFormat yFormat = new SimpleDateFormat("yyyy");
		SimpleDateFormat mFormat = new SimpleDateFormat("MM");
		SimpleDateFormat dFormat = new SimpleDateFormat("dd");
		
		int nowYear = Integer.parseInt(yFormat.format(date));
		int nowMonth = Integer.parseInt(mFormat.format(date));
		int nowDay = Integer.parseInt(dFormat.format(date));
		
		String result = "";
		if(year==nowYear) {
			if(month==nowMonth) {
				if(day==nowDay) {
					result ="오늘";
				}else {
					result = nowDay-day+"일전";
				}
			}else {
				result = nowMonth-month+"달전";
			}
		}else {
			result = nowYear-year+"년전";
		}
		
		
		return result;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getComNo() {
		return comNo;
	}
	public void setComNo(int comNo) {
		this.comNo = comNo;
	}
	public String getUserimage() {
		return userimage;
	}
	public void setUserimage(String userimage) {
		this.userimage = userimage;
	}
	
	
	
	
}
