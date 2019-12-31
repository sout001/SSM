package com.zking.SSM.test;

import java.lang.annotation.*;

/**
 * create by CSQ on 2019-12-30
 */
@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface LoggerDemo {
}
