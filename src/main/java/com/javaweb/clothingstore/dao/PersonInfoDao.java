package com.javaweb.clothingstore.dao;

import com.javaweb.clothingstore.entity.PersonInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface PersonInfoDao {
    int insertPersonInfo(PersonInfo personInfo);

    int updatePersonInfo(PersonInfo personInfo);

    PersonInfo selectPersonInfoByEmail(PersonInfo personInfo);
}
