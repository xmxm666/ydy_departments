package com.ydy.application.mapper.role;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ydy.application.entity.role.AuthRoleResource;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

/**
 */
public interface AuthRoleResourceMapper extends BaseMapper<AuthRoleResource> {

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
    Integer insert(AuthRoleResource record) throws DataAccessException;

    /**
     * description TODO
     *
     * @param record 1
     * @return int
     * @throws DataAccessException when
     */
    int insertSelective(AuthRoleResource record) throws DataAccessException;

    /**
     * description TODO
     *
     * @param id 1
     * @return com.usthe.bootshiro.domain.bo.AuthRoleResource
     * @throws DataAccessException when
     */
    AuthRoleResource selectByPrimaryKey(Integer id) throws DataAccessException;

    /**
     * description TODO
     *
     * @param record 1
     * @return int
     * @throws DataAccessException when
     */
    int updateByPrimaryKeySelective(AuthRoleResource record) throws DataAccessException;

    /**
     * description TODO
     *
     * @param record 1
     * @return int
     * @throws DataAccessException when
     */
    int updateByPrimaryKey(AuthRoleResource record) throws DataAccessException;

    /**
     * @param roleId 1
     * @param resourceId 2
     * @return int
     * @throws DataAccessException when
     */
    int deleteByUniqueKey(@Param("roleId") Integer roleId, @Param("resourceId") Integer resourceId) throws DataAccessException;
}