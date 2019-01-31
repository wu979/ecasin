package com.csd.log.aspect;

import com.csd.common.loginUser.LoginUser;
import com.csd.exception.handler.ApplicationExceptionHandler;
import com.csd.log.annotation.SystemControllerLog;
import com.csd.log.annotation.SystemServiceLog;
import com.csd.log.systemLog.po.SystemLog;
import com.csd.log.util.LogUtil;
import com.csd.utils.ConstantUtil;
import com.csd.utils.DateUtil;
import com.csd.utils.UUIDUtil;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 15:06.
 */
@Aspect
@Component
public class SystemLogAspect {

    //本地异常日志记录对象
    private  static  final Logger logger = LoggerFactory.getLogger(SystemLogAspect. class);

    @Autowired
    private ApplicationExceptionHandler handler;

    /***
     * 定义controller切入点拦截规则，拦截SystemControllerLog注解的方法
     */
    @Pointcut("@annotation(com.csd.log.annotation.SystemControllerLog)")
    public void controllerAspect(){}


    /***
     * 定义Service切入点拦截规则，拦截SystemServiceLog注解的方法
     */
    @Pointcut("@annotation(com.csd.log.annotation.SystemServiceLog)")
    public  void serviceAspect(){}


    /***
     * 拦截控制层的操作日志 前置
     * @param joinPoint
     * @return
     * @throws Throwable
     */
    @Before("controllerAspect()")
    public void doBefore(JoinPoint joinPoint) {
        try {
            SystemLog systemLog = new SystemLog();
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            String ip = request.getRemoteAddr();
            Map<String, Object> map = getControllerMethodDescription(joinPoint);
            String type = (String)map.get("actionType");
            Object[] params = joinPoint.getArgs() ;
            StringBuffer returnStr = new StringBuffer();
            for(Object param : params){
                Field[] fields = param.getClass().getDeclaredFields();
                for (int i = 0; i < fields.length ; i++) {
                    Object value = getFieldValueByName(fields[i].getName(),param);
                    if(value != null){
                        returnStr.append(fields[i].getName() + ":" + value + ";");
                    }
                }
            }
            systemLog.setLogParams(returnStr.toString());
            systemLog.setLogMethodType(ConstantUtil.CODE_ONE);
            systemLog.setLogBusiness((String)map.get("description"));
            systemLog.setLogType((String)map.get("actionType"));
            systemLog.setLogIp(ip);
            systemLog.setLogId(UUIDUtil.getUUID());
            systemLog.setLogCreateUserId(LoginUser.getLoginUserId());
            systemLog.setLogCreateUserName(LoginUser.getLoginUserName());
            systemLog.setLogCreateTime(DateUtil.getTime());
            systemLog.setLogTable(joinPoint.getSignature().getName());

            LogUtil.writeMainLog(systemLog);
        }catch (Exception e){
            //记录本地异常日志
            logger.error("==异常通知异常==");
            logger.error("异常信息:{}", e.getMessage());
        }
    }


    /**
     * 异常通知 用于拦截service层记录异常日志
     *
     * @param joinPoint
     * @param e
     */
    @AfterThrowing(pointcut = "serviceAspect()", throwing = "e")
    public void doAfterThrowing(JoinPoint joinPoint, Throwable e) {
        SystemLog systemLog = new SystemLog();
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        //读取session中的用户
        //User user = LoginUser.getLoginUser();
        //获取请求ip
        String ip = request.getRemoteAddr();
        //获取用户请求方法的参数并序列化为JSON格式字符串
        StringBuffer returnStr = new StringBuffer();
        Object[] params = joinPoint.getArgs() ;
        for(Object param : params){
            Field[] fields = param.getClass().getDeclaredFields();
            for (int i = 0; i < fields.length ; i++) {
                Object value = getFieldValueByName(fields[i].getName(),param);
                if(value != null){
                    returnStr.append(fields[i].getName() + ":" + value + ";");
                }
            }
        }
        try {
            Map<String, Object> map = getServiceMthodDescription(joinPoint);
            systemLog.setLogParams(returnStr.toString());
            systemLog.setLogMethodType(ConstantUtil.CODE_TWO);
            systemLog.setLogBusiness((String)map.get("description"));
            systemLog.setLogIp(ip);
            systemLog.setLogId(UUIDUtil.getUUID());
            systemLog.setLogCreateUserId(LoginUser.getLoginUserId());
            systemLog.setLogCreateUserName(LoginUser.getLoginUserName());
            systemLog.setLogCreateTime(DateUtil.getTime());
            systemLog.setLogTable(joinPoint.getSignature().getName());

            LogUtil.writeMainLog(systemLog);
            throw new Exception(e);
        }  catch (Exception ex) {
            //记录本地异常日志
            logger.error("==异常通知异常==");
            logger.error("异常信息:{}", ex.getMessage());
            logger.error("异常方法:{}异常代码:{}异常信息:{}参数:{}", joinPoint.getTarget().getClass().getName() + joinPoint.getSignature().getName(), e.getClass().getName(), e.getMessage(), params);
            handler.handlerException(ex);
        }
    }



    /***
     * 获取controller的操作信息
     * @param joinPoint
     * @return
     */
    public Map<String,Object> getControllerMethodDescription(JoinPoint joinPoint) throws  Exception {
        Map<String,Object> map = new HashMap<>();
        //获取连接点目标类名
        String targetName = joinPoint.getTarget().getClass().getName() ;
        //获取连接点签名的方法名
        String methodName = joinPoint.getSignature().getName() ;
        //获取连接点参数
        Object[] args = joinPoint.getArgs() ;
        //根据连接点类的名字获取指定类
        Class targetClass = Class.forName(targetName);
        //获取类里面的方法
        Method[] methods = targetClass.getMethods() ;
        String description = "" ;
        String actionType = "";
        for (Method method : methods) {
            if (method.getName().equals(methodName)){
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == args.length){
                    description = method.getAnnotation(SystemControllerLog.class).descrption();
                    actionType = method.getAnnotation(SystemControllerLog.class).actionType();
                    map.put("description",description);
                    map.put("actionType",actionType);
                    break;
                }
            }
        }
        return map ;
    }


    /**
     * 获取注解中对方法的描述信息 用于service层注解
     *
     * @param joinPoint 切点
     * @return 方法描述
     * @throws Exception
     */
    public Map<String,Object> getServiceMthodDescription(JoinPoint joinPoint) throws Exception {
        Map<String,Object> map = new HashMap<>();
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = Class.forName(targetName);
        Method[] methods = targetClass.getMethods();
        String description = "";
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    description = method.getAnnotation(SystemServiceLog. class).descrption();
                    map.put("description",description);
                    break;
                }
            }
        }
        return map;
    }


    /**
     * 获取对象的所有属性值，返回一个对象数组
     * */
    public Object[] getFiledValues(Object o){
        String[] fieldNames=this.getFiledName(o);
        Object[] value=new Object[fieldNames.length];
        for(int i=0;i<fieldNames.length;i++){
            value[i]=this.getFieldValueByName(fieldNames[i], o);
        }
        return value;
    }

    /**
     * 获取属性名数组
     * */
    private String[] getFiledName(Object o){
        Field[] fields=o.getClass().getDeclaredFields();
        String[] fieldNames=new String[fields.length];
        for(int i=0;i<fields.length;i++){
            System.out.println(fields[i].getType());
            fieldNames[i]=fields[i].getName();
        }
        return fieldNames;
    }

    /**
     * 根据属性名获取属性值
     * */
    private Object getFieldValueByName(String fieldName, Object o) {
        try {
            String firstLetter = fieldName.substring(0, 1).toUpperCase();
            String getter = "get" + firstLetter + fieldName.substring(1);
            Method method = o.getClass().getMethod(getter, new Class[] {});
            Object value = method.invoke(o, new Object[] {});
            return value;
        } catch (Exception e) {
            return null;
        }
    }


    public String getIp(){
        StringBuilder sb = new StringBuilder();
        try {
            Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces();//获取本地所有网络接口
            while (en.hasMoreElements()) {//遍历枚举中的每一个元素
                NetworkInterface ni= (NetworkInterface) en.nextElement();
                Enumeration<InetAddress> enumInetAddr = ni.getInetAddresses();
                while (enumInetAddr.hasMoreElements()) {
                    InetAddress inetAddress = (InetAddress) enumInetAddr.nextElement();
                    if (!inetAddress.isLoopbackAddress()  && !inetAddress.isLinkLocalAddress()
                            && inetAddress.isSiteLocalAddress()) {
                        sb.append("name:" + inetAddress.getHostName().toString()+"\n");
                        sb.append("ip:" + inetAddress.getHostAddress().toString()+"\n");
                    }
                }
            }
        } catch (SocketException e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
}
