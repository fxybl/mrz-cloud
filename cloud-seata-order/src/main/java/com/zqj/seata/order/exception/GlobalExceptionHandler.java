package com.zqj.seata.order.exception;

import com.zqj.seata.api.resp.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @author zqj
 * @create 2019-12-26 18:08
 */

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    //@NotNull此类注解抛出此异常
    @ExceptionHandler(value = ConstraintViolationException.class)
    //@ResponseBody
    public Result<String> validateException(ConstraintViolationException e){
        //每种异常遍历出来返回
        Set<ConstraintViolation<?>> constraintViolations = e.getConstraintViolations();
        List<String> list = new ArrayList<>();
        for(ConstraintViolation<?> c : constraintViolations){
            list.add(c.getMessageTemplate());
        }
        Result<String> result = new Result<>();
        result.setCode(466);
        result.setMessage(list.toString());
        return result;
    }

    //@validate 实体类加分组group的此类注解抛出此异常
    @ExceptionHandler(value = BindException.class)
    //@ResponseBody
    public Result<String> validateException(BindException e){
        //每种异常遍历出来返回
        BindingResult bindingResult = e.getBindingResult();
        List<String> list = new ArrayList<>();
        for(FieldError c : bindingResult.getFieldErrors()){
            list.add(c.getDefaultMessage());
        }
        Result<String> result = new Result<>();
        result.setCode(466);
        result.setMessage(list.toString());
        return result;
    }

    //
    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    public Result<String> validateException(MethodArgumentNotValidException e){
        //每种异常遍历出来返回
        BindingResult bindingResult = e.getBindingResult();
        List<String> list = new ArrayList<>();
        for(FieldError c : bindingResult.getFieldErrors()){
            list.add(c.getDefaultMessage());
        }
        Result<String> result = new Result<>();
        result.setCode(466);
        result.setMessage(list.toString());
        return result;
    }

    //请求方式不支持异常,比如get请求使用了post
    @ExceptionHandler(value = HttpRequestMethodNotSupportedException.class)
    public Result<String> handleException(HttpRequestMethodNotSupportedException e){
        Result<String> result = new Result<>();
        result.setCode(455);
        result.setMessage("该"+e.getMethod()+"方式的请求不支持");
        return result;
    }



    //系统异常
    @ExceptionHandler(value = Exception.class)
    public Result<String> exception(Exception e){
        Result<String> result = new Result<>();
        result.setCode(488);
        log.error("请求失败，失败原因:{}",e);
        result.setMessage("未知异常");
        result.setData(e.getMessage());
        return result;
    }





}
