package com.ydy.application.mapper.role;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ydy.application.entity.role.AuthUserRole;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 */
public interface AuthUserRoleMapper  extends BaseMapper<AuthUserRole> {

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

    List<AuthUserRole> selectByRoleId(@Param("roleId") Integer roleId);

    Integer[] selectByUserId(@Param("userId") Integer userId);
}