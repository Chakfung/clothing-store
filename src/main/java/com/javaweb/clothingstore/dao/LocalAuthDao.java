package com.javaweb.clothingstore.dao;

import com.javaweb.clothingstore.entity.LocalAuth;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public interface LocalAuthDao {
    LocalAuth queryLocalByUserNameAndPwd(@Param("userName") String username, @Param("password") String password);

    LocalAuth queryLocalByUserId(@Param("userId") long userId);

    int insertLocalAuth(LocalAuth localAuth);

    int updateLocalAuth(@Param("userId") Long userId, @Param("userName") String username
            , @Param("password") String password, @Param("newPassword") String newPassword,
                        @Param("lastEditTime") Date lastEditTime);

}
