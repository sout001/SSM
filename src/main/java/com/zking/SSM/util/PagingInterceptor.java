package com.zking.SSM.util;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @outhor csq
 * @create 2019-11-2016;41
 */
@Component
@Aspect
public class PagingInterceptor {
    @Around(value = "execution(* *..Service.*Paging(..))")
    public Object paging(ProceedingJoinPoint point) throws Throwable {

       Object[] args = point.getArgs();
       PageBean pageBean = null;
        for (Object arg: args) {
            if (arg instanceof  PageBean) {
                pageBean = (PageBean)arg;
            }
        }

        if (pageBean != null && pageBean.isPagination()) {
            PageHelper.startPage(pageBean.getPage(), pageBean.getRows());
        }

        Object lst = point.proceed();

        if (pageBean != null && pageBean.isPagination()){
            PageInfo pageInfo = new PageInfo((List) lst);
            pageBean.setTotal(Long.valueOf(pageInfo.getTotal()).intValue());
        }

        return lst;
    }
}
