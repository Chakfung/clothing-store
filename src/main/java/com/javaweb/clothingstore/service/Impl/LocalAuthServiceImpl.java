package com.javaweb.clothingstore.service.Impl;

import com.javaweb.clothingstore.dao.LocalAuthDao;
import com.javaweb.clothingstore.dto.LocalAuthExecution;
import com.javaweb.clothingstore.entity.LocalAuth;
import com.javaweb.clothingstore.enums.LocalAuthStateEnum;
import com.javaweb.clothingstore.exceptions.LocalAuthOperationException;
import com.javaweb.clothingstore.service.LocalAuthService;
import com.javaweb.clothingstore.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
public class LocalAuthServiceImpl implements LocalAuthService {
    @Autowired
    private LocalAuthDao localAuthDao;

    @Override
    public LocalAuth getLocalAuthByUsernameAndPwd(String username, String password) {
        return localAuthDao.queryLocalByUserNameAndPwd(username, MD5.getMd5(password));
    }

    @Override
    public LocalAuth getLocalAuthByUserId(long userId) {
        return localAuthDao.queryLocalByUserId(userId);
    }

    @Override
    @Transactional
    public LocalAuthExecution bindLocalAuth(LocalAuth localAuth) throws LocalAuthOperationException {
        if (localAuth == null || localAuth.getPassword() == null || localAuth.getUserName() == null
                || localAuth.getPersonInfo() == null || localAuth.getPersonInfo().getUserId() == null) {
            return new LocalAuthExecution(LocalAuthStateEnum.NULL_AUTH_INFO);
        }
        LocalAuth tempAuth = localAuthDao.queryLocalByUserId(localAuth.getPersonInfo().getUserId());
        if (tempAuth != null) {
            return new LocalAuthExecution(LocalAuthStateEnum.ONLY_ONE_ACCOUNT);
        }
        try {
            localAuth.setCreateTime(new Date());
            localAuth.setLastEditTime(new Date());
            localAuth.setPassword(MD5.getMd5(localAuth.getPassword()));
            int effectedNum = localAuthDao.insertLocalAuth(localAuth);
            if (effectedNum <= 0) {
                throw new LocalAuthOperationException("绑定失败");
            } else {
                return new LocalAuthExecution(LocalAuthStateEnum.SUCCESS, localAuth);
            }
        } catch (Exception e) {
            throw  new LocalAuthOperationException("insertLocaAuth error" + e.getMessage());
        }

    }

    @Override
    @Transactional
    public LocalAuthExecution modifyLocalAuth(Long userId, String username, String password, String newpassword) throws LocalAuthOperationException {
        if (userId != null && username != null && password != null && newpassword != null && !password.equals(newpassword)) {
            try {
                int effectedNum = localAuthDao.updateLocalAuth(userId, username, MD5.getMd5(password),
                        MD5.getMd5(newpassword), new Date());
                if (effectedNum <= 0) {
                    throw new LocalAuthOperationException("更新密码失败");
                }
                return new LocalAuthExecution(LocalAuthStateEnum.SUCCESS);
            } catch (Exception e) {
                throw new LocalAuthOperationException("更新密码失败" + e.toString());
            }
        } else {
            return new LocalAuthExecution(LocalAuthStateEnum.NULL_AUTH_INFO);
        }
    }

    @Override
    @Transactional
    public LocalAuthExecution addLocalAuth(LocalAuth localAuth) {
        if (localAuth != null) {
            try {
                int effectedNum = localAuthDao.insertLocalAuth(localAuth);
                if (effectedNum > 0) {
                    return new LocalAuthExecution(LocalAuthStateEnum.SUCCESS);
                } else {
                    return new LocalAuthExecution(LocalAuthStateEnum.INNER_ERROR);
                }
            } catch (Exception e) {
                throw new LocalAuthOperationException("add LocalAuth Exception" + e.getMessage());
            }
        } else {
            return new LocalAuthExecution(LocalAuthStateEnum.INNER_ERROR);
        }
    }
}
