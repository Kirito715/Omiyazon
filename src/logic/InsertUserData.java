package logic;

import bean.MemberBean;
import common.DBClass;

public class InsertUserData {

	public String insert(MemberBean mb) {
		DBClass db = new DBClass();
		db.dbOpen();
		db.insertUserData(mb);
		String userId = db.getUserId(mb.getEmail(),mb.getPass());
		db.dbClose();
		return userId;
	}

}
