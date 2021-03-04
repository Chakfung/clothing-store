package com.javaweb.clothingstore.service;

import com.javaweb.clothingstore.entity.PersonInfo;

public interface PersonInfoService {
    int addPersonInfo(PersonInfo personInfo);

    int editPersonInfo(PersonInfo personInfo);

    PersonInfo getPersonInfoByEmail(PersonInfo personInfo);
}
