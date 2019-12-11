/**
 * Copyright 2013-2019 Xia Jun(3979434@qq.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 ***************************************************************************************
 *                                                                                     *
 *                        Website : http://www.farsunset.com                           *
 *                                                                                     *
 ***************************************************************************************
 */
package com.ydy.application.cim.service.impl;

import com.farsunset.cim.sdk.server.handler.CIMNioSocketAcceptor;
import com.farsunset.cim.sdk.server.model.CIMSession;
import com.ydy.application.cim.service.CIMSessionService;
import com.ydy.application.service.department.DepartmentsSectionService;
import com.ydy.application.util.Constants;
import com.ydy.application.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;


@Service
public class CIMSessionServiceImpl implements CIMSessionService {

	@Resource
	private RedisUtil redisUtil;

 	@Resource
 	private CIMNioSocketAcceptor nioSocketAcceptor;

// 	@Autowired
//	private DepartmentsAdminService adminService;

 	@Autowired
	private DepartmentsSectionService sectionService;

	@Override
	public void save(CIMSession session) {
		//TODO	CIM_SESSION过期时间未设置
		//	account格式:UUID-sectionId
 		String account = session.getAccount();
		String sectionId = getId(account);
		//将同一科室的account放入一个hash表中
		redisUtil.hset(Constants.CIM_SECTION + sectionId, account, session);
	}

	/**
	 *
	 * @param account 用户id
	 * @return
	 */

	@Override
	public CIMSession get(String account) {
		String sectionId = getId(account);
		CIMSession session = (CIMSession) redisUtil.hget(Constants.CIM_SECTION + sectionId, account);
		 if (session != null){
			 session.setSession(nioSocketAcceptor.getManagedSession(session.getNid()));
		 }
		 return session;
	}

	@Override
	public void remove(String account) {
		String sectionId = getId(account);
		redisUtil.hdel(Constants.CIM_SECTION + sectionId, account);
	}

	public String getId(String account) {
		if(StringUtils.isEmpty(account)) {
			return "";
		}
		int begin = account.lastIndexOf("-") + 1;
		int end = account.length();
		String id = account.substring(begin, end);
		return id;
	}
	 
}
