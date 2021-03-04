package com.javaweb.clothingstore.service;

import com.javaweb.clothingstore.dto.LocalAuthExecution;
import com.javaweb.clothingstore.entity.LocalAuth;
import com.javaweb.clothingstore.exceptions.LocalAuthOperationException;

public interface LocalAuthService {
    LocalAuth getLocalAuthByUsernameAndPwd(String username, String password);

    LocalAuth getLocalAuthByUserId(long userId);

    LocalAuthExecution bindLocalAuth(LocalAuth localAuth) throws LocalAuthOperationException;

    LocalAuthExecution modifyLocalAuth(Long userId, String username, String password, String newpassword) throws LocalAuthOperationException;

    LocalAuthExecution addLocalAuth(LocalAuth localAuth);

}
