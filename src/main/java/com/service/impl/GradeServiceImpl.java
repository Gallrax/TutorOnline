package com.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.dao.GradeDao;
import com.entity.Grade;
import com.service.GradeService;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/4/27.
 */
@Service
public class GradeServiceImpl extends ServiceImpl<GradeDao, Grade> implements GradeService{
}
