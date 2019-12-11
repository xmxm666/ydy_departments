package com.ydy.application.mapper.role;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ydy.application.entity.role.AuthResource;
import com.ydy.application.shiro.rule.RolePermRule;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;
import java.util.Map;

/**
 */
public interface AuthResourceMapper extends BaseMapper<AuthResource> {
    /**
     * @param id 1
     * @return int
     * @throws DataAccessException when
     */
    int deleteByPrimaryKey(Integer id) throws DataAccessException;

    /**
     * @param record 1
     * @return int
     * @throws DataAccessException when
     */
    int insertSelective(AuthResource record) throws DataAccessException;

    /**
     * description TODO
     *
     * @param id 1
     * @return AuthResource
     * @throws DataAccessException when
     */
    AuthResource selectByPrimaryKey(Integer id) throws DataAccessException;

    /**
     * @param record 1
     * @return int
     * @throws DataAccessException when
     */
    int updateByPrimaryKeySelective(AuthResource record) throws DataAccessException;

    /**
     * @param record 1
     * @return int
     * @throws DataAccessException when
     */
    int updateByPrimaryKey(AuthResource record) throws DataAccessException;

    /**
     * description TODO
     *
     * @return java.util.List<RolePermRule>
     * @throws DataAccessException when
     */
    List<RolePermRule> selectRoleRules()  throws DataAccessException;

    /**
     * @param uid 1
     * @return java.util.List<AuthResource>
     * @throws DataAccessException when
     */
    List<AuthResource> selectAuthorityMenusByUid(@Param("uid") Integer uid) throws DataAccessException;

    /**
     * @return java.util.List<AuthResource>
     * @throws DataAccessException when
     */
    List<AuthResource> selectMenus() throws DataAccessException;


    /**
     * @param roleId 1
     * @return java.util.List<AuthResource>
     * @throws DataAccessException when
     */
    List<AuthResource> selectMenusByRoleId(Integer roleId) throws DataAccessException;

    Integer getCount(@Param("map") Map<String, Object> queryInfo);

    List<AuthResource> getPageList(@Param("map") Map<String, Object> queryInfo);

    Integer getParendId(@Param("pid") Integer menuId);
}