package com.javaweb.clothingstore.dao;

import com.javaweb.clothingstore.BaseTest;
import com.javaweb.clothingstore.entity.LocalAuth;
import com.javaweb.clothingstore.entity.PersonInfo;
import com.javaweb.clothingstore.util.MD5;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

import static org.junit.Assert.assertEquals;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class LocalAuthDaoTest extends BaseTest {
    @Autowired
    private LocalAuthDao localAuthDao;
    private static final String username = "buy";
    private static final String password = "123456";

    @Test
    public void testAInsertLocalAuth() throws Exception {
        LocalAuth localAuth = new LocalAuth();
        PersonInfo personInfo = new PersonInfo();
        personInfo.setUserId(2L);
        localAuth.setPersonInfo(personInfo);
        localAuth.setUserName(username);
        localAuth.setPassword(MD5.getMd5(password));
        localAuth.setCreateTime(new Date());
        int effectedNum = localAuthDao.insertLocalAuth(localAuth);
        assertEquals(1, effectedNum);
    }

    @Test
    @Ignore
    public void testBQueryLocalByUserNameAndPwd() throws Exception {
        LocalAuth localAuth = localAuthDao.queryLocalByUserNameAndPwd(username, password);
        assertEquals("测试", localAuth.getPersonInfo().getName());
    }

    @Test
    @Ignore
    public void testCQueryLocalByUserId() throws Exception {
        LocalAuth localAuth = localAuthDao.queryLocalByUserId(1L);
        assertEquals("测试", localAuth.getPersonInfo().getName());
    }

    @Test
    @Ignore
    public void testDUpdateLocalAuth() throws Exception {
        Date now = new Date();
        int effectedNum = localAuthDao.updateLocalAuth(1L, username, password, password + "new", now);
        assertEquals(1, effectedNum);
        LocalAuth localAuth = localAuthDao.queryLocalByUserId(1L);
        System.out.println(localAuth.getPassword());
    }

}
