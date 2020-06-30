package common;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
//import java.util.ArrayList;
//
	import bean.DetailBean;


public class DBClass {

	// DB接続用コネクション
	Connection objCon;

	// 接続文字列
	String connUrl = "";

	public DBClass() {
		try {
		    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

		    String serverName = "Localhost\\SQLEXPRESS";	// サーバ名
		    String dbName = "Omiyazon";						// データベース名

		    String userName = "sa";							// ユーザ名
		    String password = "Step2154822";				// パスワード

		    connUrl = "jdbc:sqlserver://" + serverName + ";";
		    connUrl += "database=" + dbName + ";";
		    connUrl += "integratedSecurity=false;";
		    connUrl += "user=" + userName + ";";
		    connUrl += "password=" + password + ";";

		}
		catch(Exception objEx) {
			System.err.println(objEx.getClass().getName() + ":" + objEx.getMessage());
		}
	}




	/**
	 * DB接続処理
	 *
	 * @return 接続結果（true:接続成功、false：接続失敗）
	 */


	public boolean dbOpen() {
		try {

		    // 接続開始
			objCon =DriverManager.getConnection(connUrl);

			System.out.println("DB接続成功");

		    // 接続成功
		    return true;
		}
		catch(Exception objEx) {
			// エラー表示
			System.err.println(objEx.getClass().getName() + ":" + objEx.getMessage());

			// 接続失敗
			return false;
		}
	}

	/**
	 * DB切断処理
	 *
	 * @return 切断結果（true:切断成功、false：切断失敗）
	 */
	public boolean dbClose() {
		try {

		    // 切断開始
			objCon.close();

			System.out.println("DB切断成功");

		    // 切断成功
		    return true;
		}
		catch(Exception objEx) {
			// エラー表示
			System.err.println(objEx.getClass().getName() + ":" + objEx.getMessage());

			// 切断失敗
			return false;
		}
	}

	/**
	 * 商品検索(ヘッダー)
	 * @param name
	 * @return
	 */
	public ArrayList<String[]> getItemList(String name){
		ArrayList<String[]> ary = new ArrayList<String[]>();

		try {
	        String sql = "";
	        sql += " SELECT 商品ID,商品名,加盟店名,ジャンル名,単価,画像パス1,注文上限数";
	        sql += " FROM   商品マスタ sm";
	        sql += " INNER JOIN ジャンルマスタ gm";
	        sql += " ON sm.ジャンルID = gm.ジャンルID";
	        sql += " WHERE 商品名 LIKE ?";
	        sql += " AND   削除フラグ=0";

	        PreparedStatement ps = objCon.prepareStatement(sql);

	        ps.setString(1,"%"+ name +"%");

	        ResultSet rs = ps.executeQuery();

	        while(rs.next()) {
	        	String[] strData = new String[8];

	        	strData[0] =rs.getString("商品ID");
	        	strData[1] =rs.getString("商品名");
	        	strData[2] =rs.getString("加盟店名");
	        	strData[3] =rs.getString("ジャンル名");
	        	strData[4] =rs.getString("単価");
	        	strData[5] =rs.getString("画像パス1");
	        	//評価
	        	strData[6] =getItemVal(strData[0]);

	        	//在庫
	        	if(rs.getInt("注文上限数") > getStock(rs.getInt("商品ID"))){
	        		strData[7] = "在庫あり";
	        	}
	        	else {
	        		strData[7] = "在庫なし";
	        	}

	        	ary.add(strData);
	        }

	        rs.close();	// ResultSetのクローズ
	        ps.close();	// Statementのクローズ


		} catch (SQLException e) {
			// エラー表示
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}

		return ary;
	}

	/**
	 * 地方データ取得
	 * @return
	 */
	public ArrayList<String[]> getRegion(){
		ArrayList<String[]> ary = new ArrayList<String[]>();
		try {
	        String sql = "";
	        sql += " SELECT *";
	        sql += " FROM   地方マスタ";

	        PreparedStatement ps = objCon.prepareStatement(sql);

	        ResultSet rs = ps.executeQuery();

	        while(rs.next()) {
	        	String[] strData = new String[6];

	        	strData[0] =rs.getString("地方ID");
	        	strData[1] =rs.getString("地方名");

	        	ary.add(strData);
	        }

	        rs.close();	// ResultSetのクローズ
	        ps.close();	// Statementのクローズ


		} catch (SQLException e) {
			// エラー表示
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}

		return ary;
	}

	/**
	 * 都道府県データ取得
	 * @return
	 */
	public ArrayList<String[]> getPref(){
		ArrayList<String[]> ary = new ArrayList<String[]>();
		try {
	        String sql = "";
	        sql += " SELECT *";
	        sql += " FROM   県マスタ";

	        PreparedStatement ps = objCon.prepareStatement(sql);

	        ResultSet rs = ps.executeQuery();

	        while(rs.next()) {
	        	String[] strData = new String[6];

	        	strData[0] =rs.getString("県ID");
	        	strData[1] =rs.getString("都道府県名");
	        	strData[2] =rs.getString("地方ID");

	        	ary.add(strData);
	        }

	        rs.close();	// ResultSetのクローズ
	        ps.close();	// Statementのクローズ


		} catch (SQLException e) {
			// エラー表示
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}

		return ary;
	}

	/**
	 * 評価平均値を取得
	 * @param id
	 * @return
	 */
	public String getItemVal(String id) {
		String val = "0";
		try {
	        String sql = "";
	        sql += " SELECT AVG(評価) 平均評価";
	        sql += " FROM   レビューマスタ";
	        sql += " WHERE 商品ID = ?";
	        sql += " GROUP BY 商品ID";

	        PreparedStatement ps = objCon.prepareStatement(sql);

	        ps.setString(1,id);

	        ResultSet rs = ps.executeQuery();

	        while(rs.next()) {
	        	val =rs.getString("平均評価");
	        }
	        rs.close();	// ResultSetのクローズ
	        ps.close();	// Statementのクローズ

		} catch (SQLException e) {
			// エラー表示
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}

		return val;
	}


//商品詳細の初期設定
	public DetailBean getDetailData(DetailBean bean) {
//ログイン状態に関わらず行う処理
		bean = getItemDetail(bean);
		bean = getReview(bean);
//ログイン状態がtrueの場合の処理
		if(bean.getLogin()) {
			bean=judgeFavorite(bean);
			bean=judgeReview(bean);
			bean.setOrdable(bean.getOrdable()-getStock(bean.getItemid()));
			bean=judgeCart(bean);
		}
		return bean;
	}

	private DetailBean getItemDetail(DetailBean bean) {
		 Statement stmt;

			try {

				stmt = objCon.createStatement();

		        String sql = "";
		        sql += " SELECT 商品名,加盟店名,単価,商品概要,画像パス1,画像パス2,画像パス3,画像パス4,画像パス5,注文上限数";
		        sql += " FROM 商品マスタ";
		        sql += " WHERE 商品ID = ? AND 削除フラグ='0' ";

				// データ取得
				PreparedStatement ps = objCon.prepareStatement(sql);
				// プレースホルダにパラメータを設定
				ps.setInt(1, bean.getItemid());
				// 実行SQL確認
				System.out.println(sql);

				// sqlを実行し、結果を取得
				ResultSet rset = ps.executeQuery();
				rset.next();
				bean.setItemname(rset.getString("商品名"));
				bean.setStorename(rset.getString("加盟店名"));
				bean.setPrice(rset.getInt("単価"));
				bean.setOutline(rset.getString("商品概要"));
				bean.setImage1(rset.getString("画像パス1"));
				bean.setImage2(rset.getString("画像パス2"));
				bean.setImage3(rset.getString("画像パス3"));
				bean.setImage4(rset.getString("画像パス4"));
				bean.setImage5(rset.getString("画像パス5"));
				bean.setOrdable(rset.getInt("注文上限数"));

		        rset.close();	// ResultSetのクローズ
		        stmt.close();	// Statementのクローズ


			} catch (SQLException e) {
				// エラー表示
				System.err.println(e.getClass().getName() + ":" + e.getMessage());
			}
		return bean;
	}

	private DetailBean getReview(DetailBean bean) {
		ArrayList<String[]> data = new ArrayList<String[]>();

		//Statementを生成
	    Statement stmt;

		try {

			stmt = objCon.createStatement();

	        String sql = "";
	        sql += " SELECT ニックネーム,レビュー,評価";
	        sql += " FROM 登録者マスタ tm inner join レビューマスタ rm on tm.登録者ID=rm.登録者ID";
	        sql += " WHERE 商品ID = ?";

			// データ取得
			PreparedStatement ps = objCon.prepareStatement(sql);
			// プレースホルダにパラメータを設定
			ps.setInt(1,bean.getItemid());
			// 実行SQL確認
			System.out.println(sql);

			// sqlを実行し、結果を取得
			ResultSet rset = ps.executeQuery();

	        while(rset.next()) {
	        	// 取得するフィールド分の配列生成
	        	String[] strData = new String[3];
	        	strData[0] =rset.getString("ニックネーム");
	        	strData[1] =rset.getString("レビュー");
	        	strData[2] =rset.getString("評価");
	        	// リストに追加
	        	data.add(strData);

	        }

	        bean.setReviewList(data);

	        rset.close();	// ResultSetのクローズ
	        stmt.close();	// Statementのクローズ


		} catch (SQLException e) {
			// エラー表示
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}

		return bean;
	}

	private DetailBean judgeFavorite(DetailBean bean) {
		Statement stmt;

		try {

		stmt = objCon.createStatement();

        String sql = "";
        sql += " SELECT count(*) AS 判定";
        sql += " FROM お気に入りマスタ";
        sql += " WHERE 登録者ID = ? AND 商品ID = ? ";

		// データ取得
		PreparedStatement ps = objCon.prepareStatement(sql);
		// プレースホルダにパラメータを設定
		ps.setInt(1,bean.getUserid());
		ps.setInt(2,bean.getItemid());
		// 実行SQL確認
		System.out.println(sql);

		// sqlを実行し、結果を取得
		ResultSet rset = ps.executeQuery();
		rset.next();
		if(rset.getInt("判定")>0) {
			bean.setFavorite(true);
		}else {
			bean.setFavorite(false);
		}
        rset.close();	// ResultSetのクローズ
        stmt.close();	// Statementのクローズ

	} catch (SQLException e) {
		// エラー表示
		System.err.println(e.getClass().getName() + ":" + e.getMessage());
	  }
		return bean;
	}



	private DetailBean judgeReview(DetailBean bean) {

		Statement stmt;
		int i=0;

		try {

		stmt = objCon.createStatement();

        String sql = "";
        sql += " SELECT count(*) as 判定";
        sql += " FROM レビューマスタ";
        sql += " WHERE 登録者ID = ? AND 商品ID = ?";

		// データ取得
		PreparedStatement ps = objCon.prepareStatement(sql);
		// プレースホルダにパラメータを設定
		ps.setInt(1,bean.getUserid());
		ps.setInt(2,bean.getItemid());
		// 実行SQL確認
		System.out.println(sql);

		// sqlを実行し、結果を取得
		ResultSet rset = ps.executeQuery();
		rset.next();
		i=rset.getInt("判定");
        rset.close();	// ResultSetのクローズ
        stmt.close();	// Statementのクローズ

	} catch (SQLException e) {
		// エラー表示
		System.err.println(e.getClass().getName() + ":" + e.getMessage());
	  }
		if(i>0) {
			bean = getNickName(bean);
		}
		return bean;
	}

private DetailBean getNickName(DetailBean bean) {

		Statement stmt;

		try {

		stmt = objCon.createStatement();

        String sql = "";
        sql += " SELECT ニックネーム";
        sql += " FROM 伝票マスタ dm INNER JOIN 売上明細マスタ umm on dm.伝票ID=umm.伝票ID inner join 登録者マスタ tm on dm.登録者ID=dm.登録者ID";
        sql += " WHERE tm.登録者ID = ? AND 商品ID = ? AND 注文状態 = '2'";

		// データ取得
		PreparedStatement ps = objCon.prepareStatement(sql);
		// プレースホルダにパラメータを設定
		ps.setInt(1,bean.getUserid());
		ps.setInt(2,bean.getItemid());
		// 実行SQL確認
		System.out.println(sql);

		// sqlを実行し、結果を取得
		ResultSet rset = ps.executeQuery();
		rset.next();
		bean.setNickname(rset.getString("ニックネーム"));
        rset.close();	// ResultSetのクローズ
        stmt.close();	// Statementのクローズ

	} catch (SQLException e) {
		// エラー表示
		System.err.println(e.getClass().getName() + ":" + e.getMessage());
	  }

		return bean;
	}



	public int getStock(int itemid) {

		int iStock=0;
		Statement stmt;

		try {

		stmt = objCon.createStatement();

        String sql = "";
        sql += " SELECT SUM(数量) AS 未発送注文個数";
        sql += " FROM 伝票マスタ dm INNER JOIN 売上明細マスタ umm on dm.伝票ID=umm.伝票ID";
        sql += " WHERE 注文状態 = '0' AND 商品ID = ? ";
        sql += " GROUP BY 商品ID";

		// データ取得
		PreparedStatement ps = objCon.prepareStatement(sql);
		// プレースホルダにパラメータを設定
		ps.setInt(1, itemid);
		// 実行SQL確認
		System.out.println(sql);

		// sqlを実行し、結果を取得
		ResultSet rset = ps.executeQuery();
		rset.next();
		iStock=rset.getInt("未発送注文個数");

        rset.close();	// ResultSetのクローズ
        stmt.close();	// Statementのクローズ

	} catch (SQLException e) {
		// エラー表示
		System.err.println(e.getClass().getName() + ":" + e.getMessage());
	  }
		return iStock;
	}

	private DetailBean judgeCart(DetailBean bean) {

		Statement stmt;

		try {

		stmt = objCon.createStatement();

        String sql = "";
        sql += " SELECT 個数";
        sql += " FROM カートマスタ";
        sql += " WHERE 登録者ID = ? AND 商品ID = ?";

		// データ取得
		PreparedStatement ps = objCon.prepareStatement(sql);
		// プレースホルダにパラメータを設定
		ps.setInt(1,bean.getUserid());
		ps.setInt(2,bean.getItemid());
		// 実行SQL確認
		System.out.println(sql);

		// sqlを実行し、結果を取得
		ResultSet rset = ps.executeQuery();
		rset.next();
		bean.setCart(rset.getInt("個数"));
        rset.close();	// ResultSetのクローズ
        stmt.close();	// Statementのクローズ

	} catch (SQLException e) {
		// エラー表示
		System.err.println(e.getClass().getName() + ":" + e.getMessage());
	  }

		return bean;
	}


	//ユーザーログイン
		public boolean UserLogin(String mail, String pass) {

			// 戻り値定義
			boolean bReturn = false;

			try {
				String sql = "";

				sql += " SELECT *";
				sql += " FROM   登録者マスタ ";
				sql += " WHERE  メールアドレス LIKE ?";
				sql += " AND    パスワード LIKE ?";

				// データ取得
				PreparedStatement ps = objCon.prepareStatement(sql);

				// プレースホルダにパラメータを設定
				ps.setString(1, mail);
				ps.setString(2, pass);

				// 問い合わせの実行
				ResultSet rset = ps.executeQuery();
				if (rset.next() == true) {
					bReturn = true;
				}

				// 実行SQL確認
				System.out.println(sql);

				// 解放
				ps.close();

			} catch (SQLException e) {
				System.out.println("エラー");
				return bReturn = false;
			}

			return bReturn;
		}
		public ArrayList<String[]> getTAll(){

			ArrayList<String[]> Adata = new ArrayList<String[]>();

			//Statementを生成
		    Statement stmt;

			try {

				stmt = objCon.createStatement();

		        String sql = "";
		        sql += " SELECT *";
		        sql += " FROM  特集マスタ";
		        sql += " order by 公開日時 desc";

		        // 実行SQL確認
		        System.out.println(sql);

		        // 問い合わせの実行
		        ResultSet rset = stmt.executeQuery(sql);

		        while(rset.next()) {

		        	// 取得するフィールド分の配列生成
		        	String[] strData = new String[7];

		        	strData[0] =rset.getString("特集ID");
		        	strData[1] =rset.getString("タイトル");
		        	strData[2] =rset.getString("本文");
		        	strData[3] =rset.getString("公開フラグ");
		        	strData[4] =rset.getString("公開日時");
		        	strData[5] =rset.getString("終了日時");
		        	strData[6] =rset.getString("画像パス");

		        	// リストに追加
		        	Adata.add(strData);

		        }

		        rset.close();	// ResultSetのクローズ
		        stmt.close();	// Statementのクローズ


			} catch (SQLException e) {
				// エラー表示
				System.err.println(e.getClass().getName() + ":" + e.getMessage());
			}

			return Adata;
		}
		public ArrayList<String[]> getTsyousai(String tid){

			ArrayList<String[]> Adata = new ArrayList<String[]>();

			//Statementを生成
		    Statement stmt;

			try {

				stmt = objCon.createStatement();

		        String sql = "";
		        sql += " SELECT *";
		        sql += " FROM  特集マスタ";
		        sql += " where 特集ID='"+tid+"'";

		        // 実行SQL確認
		        System.out.println(sql);

		        // 問い合わせの実行
		        ResultSet rset = stmt.executeQuery(sql);

		        while(rset.next()) {

		        	// 取得するフィールド分の配列生成
		        	String[] strData = new String[7];

		        	strData[0] =rset.getString("特集ID");
		        	strData[1] =rset.getString("タイトル");
		        	strData[2] =rset.getString("本文");
		        	strData[3] =rset.getString("公開フラグ");
		        	strData[4] =rset.getString("公開日時");
		        	strData[5] =rset.getString("終了日時");
		        	strData[6] =rset.getString("画像パス");

		        	// リストに追加
		        	Adata.add(strData);

		        }

		        rset.close();	// ResultSetのクローズ
		        stmt.close();	// Statementのクローズ


			} catch (SQLException e) {
				// エラー表示
				System.err.println(e.getClass().getName() + ":" + e.getMessage());
			}

			return Adata;
		}
		public int insertT( String title, String text, String z1, String z2, String z3, String z4,
				String fdate, String qdate,String path) {

			// 実行結果件数用変数
			int retCount = 0;

			//Statementを生成
			Statement stmt;

			try {

				stmt = objCon.createStatement();
				String sql = "";
				sql += " insert 特集マスタ ";
				sql += "values ((select max(特集ID)+1 from 特集マスタ),','" + title + "','" + text + "','0','"+fdate+"','"+qdate+"','"+path+"')";
				// 実行SQL確認
				System.out.println(sql);

				// 問い合わせの実行
				//更新、削除、登録にはexecuteUpdae
				//確認はexecuteQuery
				retCount = stmt.executeUpdate(sql);

				stmt.close(); // Statementのクローズ

			} catch (SQLException e) {
				// エラー表示
				System.err.println(e.getClass().getName() + ":" + e.getMessage());
			}
			return retCount;
		}
		public ArrayList<String[]> getTAll2(String combo,String txt){

			ArrayList<String[]> Adata = new ArrayList<String[]>();

			//Statementを生成
		    Statement stmt;

			try {

				stmt = objCon.createStatement();

		        String sql = "";
		        sql += " SELECT *";
		        sql += " FROM  特集マスタ";
		        if(combo.equals("1")) sql += " order by 公開日時 desc";
		        else sql += " order by 公開日時";
		        sql += " 特集名 like '"+txt+"'";

		        // 実行SQL確認
		        System.out.println(sql);

		        // 問い合わせの実行
		        ResultSet rset = stmt.executeQuery(sql);

		        while(rset.next()) {

		        	// 取得するフィールド分の配列生成
		        	String[] strData = new String[7];

		        	strData[0] =rset.getString("特集ID");
		        	strData[1] =rset.getString("タイトル");
		        	strData[2] =rset.getString("本文");
		        	strData[3] =rset.getString("公開フラグ");
		        	strData[4] =rset.getString("公開日時");
		        	strData[5] =rset.getString("終了日時");
		        	strData[6] =rset.getString("画像パス");

		        	// リストに追加
		        	Adata.add(strData);

		        }

		        rset.close();	// ResultSetのクローズ
		        stmt.close();	// Statementのクローズ


			} catch (SQLException e) {
				// エラー表示
				System.err.println(e.getClass().getName() + ":" + e.getMessage());
			}

			return Adata;
		}
		public int updT(String tid,String txt){

			// 実行結果件数用変数
			int retCount = 0;

			//Statementを生成
		    Statement stmt;

			try {
				stmt = objCon.createStatement();

		        String sql = "";
		        sql += " UPDATE 特集マスタ";
		        sql += " set 本文='"+txt+"'";
		        sql += " WHERE  特集ID= '"+ tid +"'";

		        // 実行SQL確認
		        System.out.println(sql);

		        // 問い合わせの実行
		        //更新、削除、登録にはexecuteUpdae
		        //確認はexecuteQuery
		        retCount = stmt.executeUpdate(sql);

		        stmt.close();	// Statementのクローズ

			} catch (SQLException e) {
				// エラー表示
				System.err.println(e.getClass().getName() + ":" + e.getMessage());
			}

			return retCount;
		}
		public int updT2(String tid){

			// 実行結果件数用変数
			int retCount = 0;

			//Statementを生成
		    Statement stmt;

			try {
				stmt = objCon.createStatement();

		        String sql = "";
		        sql += " UPDATE 特集マスタ";
		        sql += " set 公開フラグ='1'";
		        sql += " WHERE  特集ID= '"+ tid +"'";

		        // 実行SQL確認
		        System.out.println(sql);

		        // 問い合わせの実行
		        //更新、削除、登録にはexecuteUpdae
		        //確認はexecuteQuery
		        retCount = stmt.executeUpdate(sql);

		        stmt.close();	// Statementのクローズ

			} catch (SQLException e) {
				// エラー表示
				System.err.println(e.getClass().getName() + ":" + e.getMessage());
			}

			return retCount;
		}
		public int updT3(String tid){

			// 実行結果件数用変数
			int retCount = 0;

			//Statementを生成
		    Statement stmt;

			try {
				stmt = objCon.createStatement();

		        String sql = "";
		        sql += " UPDATE 特集マスタ";
		        sql += " set 公開フラグ='0'";
		        sql += " WHERE  特集ID= '"+ tid +"'";

		        // 実行SQL確認
		        System.out.println(sql);

		        // 問い合わせの実行
		        //更新、削除、登録にはexecuteUpdae
		        //確認はexecuteQuery
		        retCount = stmt.executeUpdate(sql);

		        stmt.close();	// Statementのクローズ

			} catch (SQLException e) {
				// エラー表示
				System.err.println(e.getClass().getName() + ":" + e.getMessage());
			}

			return retCount;
		}
		public ArrayList<String[]> getTkanren(String tid){

			ArrayList<String[]> Adata = new ArrayList<String[]>();

			//Statementを生成
		    Statement stmt;

			try {

				stmt = objCon.createStatement();

		        String sql = "";
		        sql += "select * " ;
		        sql += " from 商品マスタ as a inner join 関連商品マスタ as b on a.商品ID=b.商品ID";
		        sql += " where 特集ID="+tid+"";


		        // 実行SQL確認
		        System.out.println(sql);

		        // 問い合わせの実行
		        ResultSet rset = stmt.executeQuery(sql);

		        while(rset.next()) {

		        	// 取得するフィールド分の配列生成
		        	String[] strData = new String[7];

		        	strData[0] =rset.getString("商品ID");
		        	strData[1] =rset.getString("商品名");
		        	strData[2] =rset.getString("単価");
		        	strData[3] =rset.getString("画像パス1");
		        	// リストに追加
		        	Adata.add(strData);

		        }

		        rset.close();	// ResultSetのクローズ
		        stmt.close();	// Statementのクローズ


			} catch (SQLException e) {
				// エラー表示
				System.err.println(e.getClass().getName() + ":" + e.getMessage());
			}

			return Adata;
		}
		public ArrayList<String[]> getdenpyou(){

			ArrayList<String[]> Adata = new ArrayList<String[]>();

			//Statementを生成
		    Statement stmt;

			try {

				stmt = objCon.createStatement();

		        String sql = "";
		        sql += " SELECT *";
		        sql += " FROM  伝票マスタ";
		        sql += " order by 購入日時 desc";

		        // 実行SQL確認
		        System.out.println(sql);

		        // 問い合わせの実行
		        ResultSet rset = stmt.executeQuery(sql);

		        while(rset.next()) {

		        	// 取得するフィールド分の配列生成
		        	String[] strData = new String[7];

		        	strData[0] =rset.getString("伝票ID");
		        	strData[1] =rset.getString("登録者ID");
		        	strData[2] =rset.getString("購入日時");
		        	strData[3] =rset.getString("注文状態");
		        	strData[4] =rset.getString("発送日時");

		        	// リストに追加
		        	Adata.add(strData);

		        }

		        rset.close();	// ResultSetのクローズ
		        stmt.close();	// Statementのクローズ


			} catch (SQLException e) {
				// エラー表示
				System.err.println(e.getClass().getName() + ":" + e.getMessage());
			}

			return Adata;
		}
		public ArrayList<String[]> getDsyousai(String did){

			ArrayList<String[]> Adata = new ArrayList<String[]>();

			//Statementを生成
		    Statement stmt;

			try {

				stmt = objCon.createStatement();

		        String sql = "";
		        sql += " SELECT *";
		        sql += " FROM  商品マスタ as a inner join 売上明細マスタ as b on a.商品ID=b.商品ID";
		        sql += " where 伝票ID='"+did+"'";

		        // 実行SQL確認
		        System.out.println(sql);

		        // 問い合わせの実行
		        ResultSet rset = stmt.executeQuery(sql);

		        while(rset.next()) {

		        	// 取得するフィールド分の配列生成
		        	String[] strData = new String[7];

		        	strData[0] =rset.getString("商品ID");
		        	strData[1] =rset.getString("商品名");
		        	strData[2] =rset.getString("単価");

		        	// リストに追加
		        	Adata.add(strData);

		        }

		        rset.close();	// ResultSetのクローズ
		        stmt.close();	// Statementのクローズ


			} catch (SQLException e) {
				// エラー表示
				System.err.println(e.getClass().getName() + ":" + e.getMessage());
			}

			return Adata;
		}
		public ArrayList<String[]> getdenpyou2(String combo,String txt){

			ArrayList<String[]> Adata = new ArrayList<String[]>();

			//Statementを生成
		    Statement stmt;

			try {

				stmt = objCon.createStatement();

		        String sql = "";
		        sql += " SELECT *";
		        sql += " FROM  伝票マスタ";
		        if(combo.equals("1")) sql += " order by 購入日時 desc";
		        else if(combo.equals("3")) {
		        	sql += " where 注文状態='0'";
		        	sql += " order by 購入日時";
		        }
		        else sql += " order by 購入日時";

		        // 実行SQL確認
		        System.out.println(sql);

		        // 問い合わせの実行
		        ResultSet rset = stmt.executeQuery(sql);

		        while(rset.next()) {

		        	// 取得するフィールド分の配列生成
		        	String[] strData = new String[7];

		        	strData[0] =rset.getString("伝票ID");
		        	strData[1] =rset.getString("登録者ID");
		        	strData[2] =rset.getString("購入日時");
		        	strData[3] =rset.getString("注文状態");
		        	strData[4] =rset.getString("発送日時");


		        	// リストに追加
		        	Adata.add(strData);

		        }

		        rset.close();	// ResultSetのクローズ
		        stmt.close();	// Statementのクローズ


			} catch (SQLException e) {
				// エラー表示
				System.err.println(e.getClass().getName() + ":" + e.getMessage());
			}

			return Adata;
		}
		public int updD(String date){

			// 実行結果件数用変数
			int retCount = 0;

			//Statementを生成
		    Statement stmt;

			try {
				stmt = objCon.createStatement();

		        String sql = "";
		        sql += " UPDATE 伝票マスタ";
		        sql += " set 注文状態='1',発送日時='"+date+"'";
		        sql += " WHERE  注文状態='0'";


		        // 実行SQL確認
		        System.out.println(sql);

		        // 問い合わせの実行
		        //更新、削除、登録にはexecuteUpdae
		        //確認はexecuteQuery
		        retCount = stmt.executeUpdate(sql);

		        stmt.close();	// Statementのクローズ

			} catch (SQLException e) {
				// エラー表示
				System.err.println(e.getClass().getName() + ":" + e.getMessage());
			}

			return retCount;
		}
		public int updD2(String date,String did){

			// 実行結果件数用変数
			int retCount = 0;

			//Statementを生成
		    Statement stmt;

			try {
				stmt = objCon.createStatement();

		        String sql = "";
		        sql += " UPDATE 伝票マスタ";
		        sql += " set 注文状態='1',発送日時='"+date+"'";
		        sql += " WHERE  伝票ID='"+did+"'";


		        // 実行SQL確認
		        System.out.println(sql);

		        // 問い合わせの実行
		        //更新、削除、登録にはexecuteUpdae
		        //確認はexecuteQuery
		        retCount = stmt.executeUpdate(sql);

		        stmt.close();	// Statementのクローズ

			} catch (SQLException e) {
				// エラー表示
				System.err.println(e.getClass().getName() + ":" + e.getMessage());
			}

			return retCount;
		}
	}

}