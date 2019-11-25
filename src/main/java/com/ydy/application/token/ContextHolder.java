/**  
* <p>Title: ContextHolder.java</p>  
* <p>Description: </p>  
* <p>Copyright: 上海卫健家健康技术有限公司 (c) 2018</p>  
* <p>Company: www.waygiga.com</p>  
* @author bob
* @date 2018年10月19日  
* @version 1.0  
*/  
package com.ydy.application.token;

import com.ydy.application.filter.AuthTokenDTO;

/**  
* <p>Title: ContextHolder.java</p>  
* <p>Description: </p>  
* @author rz
*/
public class ContextHolder {
	
	private static ThreadLocal<AuthTokenDTO> ctx = new ThreadLocal<AuthTokenDTO>();
	
	public static void set(AuthTokenDTO context) {
		ctx.remove();
		ctx.set(context);
	}
	
	public static AuthTokenDTO get() {
		return ctx.get();
	}
	
}

