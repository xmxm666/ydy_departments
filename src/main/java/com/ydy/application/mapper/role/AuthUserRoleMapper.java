package com.ydy.application.mapper.role;

import com.ydy.application.entity.role.AuthUserRole;
import org.springframework.dao.DataAccessException;

/**
 */
public interface AuthUserRoleMapper {

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
    int insert(AuthUserRole record) throws DataAccessException;

    /**
     * description TODO
     *
     * @param record 1
     * @return int
     * @throws DataAccessException when
     */
    int insertSelective(AuthUserRole record) throws DataAccessException;

    /**
     * description TODO
     *
     * @param id 1
     * @return com.usthe.bootshiro.domain.bo.AuthUserRole
     * @throws DataAccessException when
     */
    AuthUserRole selectByPrimaryKey(Integer id) throws DataAccessException;

    /**
     * description TODO
     *
     * @param record 1
     * @return int
     * @throws DataAccessException when
     */
    int updateByPrimaryKeySelective(AuthUserRole record) throws DataAccessException;

    /**
     * description TODO
     *
     * @param record 1
     * @return int
     * @throws DataAccessException when
     */
    int updateByPrimaryKey(AuthUserRole record) throws DataAccessException;

    /**
     * description TODO
     *
     * @param record 1
     * @return int
     * @throws DataAccessException when
     */
    int deleteByUniqueKey(AuthUserRole record) throws DataAccessException;
}