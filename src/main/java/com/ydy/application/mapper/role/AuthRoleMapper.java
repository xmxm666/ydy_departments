package com.ydy.application.mapper.role;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ydy.application.entity.role.AuthRole;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;
import java.util.Map;

/**
 */
public interface AuthRoleMapper extends BaseMapper<AuthRole> {
    /**
     * description TODO
     *
     * @param id 1
     * @return int
     * @throws DataAccessException when
     */
    int deleteByPrimaryKey(Integer id) throws DataAccessException;

    /**
     * description TODO
     *
     * @param record 1
     * @return int
     * @throws DataAccessException when
     */
    int insertSelective(AuthRole record) throws DataAccessException;

    /**
     * description TODO
     *
     * @param id 1
     * @return com.usthe.bootshiro.domain.bo.AuthRole
     * @throws DataAccessException when
     */
    AuthRole selectByPrimaryKey(Integer id) throws DataAccessException;

    /**
     * description TODO
     *
     * @param record 1
     * @return int
     * @throws DataAccessException when
     */
    int updateByPrimaryKeySelective(AuthRole record) throws DataAccessException;

    /**
     * description TODO
     *
     * @param record 1
     * @return int
     * @throws DataAccessException when
     */
    int updateByPrimaryKey(AuthRole record) throws DataAccessException;

    /**
     * @return java.util.List<AuthRole>
     * @throws DataAccessException when
     */
    List<AuthRole> selectRoles() throws DataAccessException;

    /**
     * 获取用户角色列表
     */
    String selectUserRoles(@Param("userId") Integer userId) ;

    Integer getCount(@Param("map") Map<String, Object> queryInfo);

    List<AuthRole> getPageList(@Param("map") Map<String, Object> queryInfo);

    AuthRole selectByCode(String code);
}