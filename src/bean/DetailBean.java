package bean;

import java.util.ArrayList;

public class DetailBean {
	Boolean login;
	int userid;
	int itemid;
	String itemname;
	int price;
	int cart;
	String outline;
	String image1;
	String image2;
	String image3;
	String image4;
	String image5;
	int ordable;
	double avgqua;
	String storename;
	String nickname;
	Boolean favorite;
	ArrayList<String[]> reviewList;


	public ArrayList<String[]> getReviewList() {
		return reviewList;
	}
	public void setReviewList(ArrayList<String[]> reviewList) {
		this.reviewList = reviewList;
	}
	public Boolean getLogin() {
		return login;
	}
	public void setLogin(Boolean login) {
		this.login = login;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getItemid() {
		return itemid;
	}
	public void setItemid(int itemid) {
		this.itemid = itemid;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCart() {
		return cart;
	}
	public void setCart(int cart) {
		this.cart = cart;
	}
	public String getOutline() {
		return outline;
	}
	public void setOutline(String outline) {
		this.outline = outline;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public String getImage4() {
		return image4;
	}
	public void setImage4(String image4) {
		this.image4 = image4;
	}
	public String getImage5() {
		return image5;
	}
	public void setImage5(String image5) {
		this.image5 = image5;
	}
	public int getOrdable() {
		return ordable;
	}
	public void setOrdable(int ordable) {
		this.ordable = ordable;
	}
	public double getAvgqua() {
		return avgqua;
	}
	public void setAvgqua(double avgqua) {
		this.avgqua = avgqua;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Boolean getFavorite() {
		return favorite;
	}
	public void setFavorite(Boolean favorite) {
		this.favorite = favorite;
	}


}
