package com.javaweb.clothingstore.service.Impl;

import com.javaweb.clothingstore.dao.PersonInfoDao;
import com.javaweb.clothingstore.entity.PersonInfo;
import com.javaweb.clothingstore.exceptions.PersonInfoException;
import com.javaweb.clothingstore.service.PersonInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PersonInfoServiceImpl implements PersonInfoService {
    @Autowired
    private PersonInfoDao personInfoDao;

    @Override
    @Transactional
    public int addPersonInfo(PersonInfo personInfo) {
        try {
            int effectedNum = personInfoDao.insertPersonInfo(personInfo);
            return effectedNum;
        } catch (Exception e) {
            throw new PersonInfoException("add PersonInfo Error" + e.getMessage());
        }
    }

    @Override
    public int editPersonInfo(PersonInfo personInfo) {
        try {
            int effectedNum = personInfoDao.updatePersonInfo(personInfo);
            return effectedNum;
        } catch (Exception e) {
            throw new PersonInfoException("edit PersonInfo Error" + e.getMessage());
        }
    }

    @Override
    public PersonInfo getPersonInfoByEmail(PersonInfo personInfo) {
        return personInfoDao.selectPersonInfoByEmail(personInfo);
    }

}
