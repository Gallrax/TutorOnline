package com.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.dao.UserDao;
import com.entity.User;
import com.service.UserService;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/4/27.
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserDao, User> implements UserService {
}
