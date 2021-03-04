package com.javaweb.clothingstore.service;

import com.javaweb.clothingstore.BaseTest;
import com.javaweb.clothingstore.dto.LocalAuthExecution;
import com.javaweb.clothingstore.entity.LocalAuth;
import com.javaweb.clothingstore.entity.PersonInfo;
import com.javaweb.clothingstore.enums.LocalAuthStateEnum;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.assertEquals;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class LocalAuthServiceTest extends BaseTest {
    @Autowired
    private LocalAuthService localAuthService;

    @Test
    public void testAModifyLocalAuth() {
        LocalAuth localAuth = new LocalAuth();
        PersonInfo personInfo = new PersonInfo();
        String username = "testusername";
        String password = "testnewpassword";
        String newpassword = "newpassword";
        personInfo.setUserId(1L);
        LocalAuthExecution lae = localAuthService.modifyLocalAuth(1L, username, password, newpassword);
        assertEquals(LocalAuthStateEnum.SUCCESS.getState(),lae.getState());
    }
}
