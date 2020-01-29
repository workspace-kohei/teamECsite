package com.internousdev.espresso.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.espresso.dao.MCategoryDAO;
import com.internousdev.espresso.dto.MCategoryDTO;
import com.internousdev.espresso.util.CommonUtility;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport implements SessionAware {

	private Map<String, Object> session;
	private String tempId;

	public String execute() {

		//ログインフラグを保持していない場合
		if (session.get("loginFlg") == null) {

			//未ログイン(0)としてログインフラグを保持
			session.put("loginFlg", 0);
		}

		//未ログイン状態(0)、かつ仮ユーザーIDを保持していない場合
		if ((int) session.get("loginFlg") == 0 && session.get("tempId") == null) {
			//仮ユーザーIDを作成
			CommonUtility commonUtility = new CommonUtility();
			tempId = commonUtility.getRamdomValue();

			//仮ユーザーIDを保持
			session.put("tempId", tempId);
		}

		//カテゴリを保持していない場合
		if (session.get("mCategoryDTOList") == null) {

			//カテゴリーマスタから、IDとNameを取り出す
			List<MCategoryDTO> mCategoryDTOList = new ArrayList<MCategoryDTO>();
			MCategoryDAO mCategoryDAO = new MCategoryDAO();
			mCategoryDTOList = mCategoryDAO.getMCategoryList();

			session.put("mCategoryDTOList", mCategoryDTOList);

		}

		return SUCCESS;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
