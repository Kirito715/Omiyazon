package logic;

import bean.MemberBean;
import common.DBClass;

public class InsertUserData {

	public void insert(MemberBean mb) {
		DBClass db = new DBClass();
		db.dbOpen();
		db.insertUserData(mb);
		return;
	}

}
