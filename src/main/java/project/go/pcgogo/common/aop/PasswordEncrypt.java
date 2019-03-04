package project.go.pcgogo.common.aop;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import edu.emory.mathcs.backport.java.util.Arrays;
import project.go.pcgogo.user.model.vo.Manager;
import project.go.pcgogo.user.model.vo.Member;

@Component
@Aspect
public class PasswordEncrypt {
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	@Around("execution(* project.go.pcgogo.user.controller.UserController..insert*(..))")
	public Object insertEncrypt(ProceedingJoinPoint joinPoint) throws Throwable {
		Object[] objArr = joinPoint.getArgs();
		for(Object o : objArr) {
			if(o instanceof Manager) {
				Manager m = (Manager)o;
				logger.info(m.toString());
				logger.info("암호화 전:"+m.getManagerPassword());
				m.setManagerPassword(pwdEncoder.encode(m.getManagerPassword()));
				logger.info("암호화 후:"+m.getManagerPassword());
			}
			else if(o instanceof Member) {
				Member m = (Member)o;
				logger.info(m.toString());
				logger.info("암호화 전:"+m.getMemberPassword());
				m.setMemberPassword(pwdEncoder.encode(m.getMemberPassword()));
				logger.info("암호화 후:"+m.getMemberPassword());
			}
		}
		Object obj = joinPoint.proceed();
		return obj;
	}

	/*
	 * 로그인 시 비밀번호 암호화 AOP
	 */
//	@Around("execution(* project.go.pcgogo.user.controller.UserController.loginReq(..))")
//	public Object loginEncrypt(ProceedingJoinPoint joinPoint) throws Throwable {
//		Object[] objArr = joinPoint.getArgs();
//		objArr[1] = pwdEncoder.encode(String.valueOf(objArr[1]));
//		logger.info(objArr[1]);
//		Object obj =joinPoint.proceed(objArr);
//		return obj;
//	}
}
