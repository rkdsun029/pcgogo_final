package project.go.pcgogo.common.aop;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import project.go.pcgogo.manager.model.vo.PcRoom;

@Component
@Aspect
public class GetSelectedPcRoom {
	
	Logger logger = Logger.getLogger(getClass());
	
	@Around("execution(* project.go.pcgogo.manager.controller.ManagerController..selected*(..))")
	public Object getSelectedPcRoom(ProceedingJoinPoint joinPoint) throws Throwable {
		
		Object[] pcRoomArr = joinPoint.getArgs();

		for(Object o : pcRoomArr) {
			if(o instanceof HttpSession) {
				PcRoom pcRoom = (PcRoom) ((HttpSession)o).getAttribute("selectedPcRoom");
				pcRoomArr[0] = pcRoom;	
			}
		}
	
		logger.info("aop : " + pcRoomArr[0]);
		
		Object o = joinPoint.proceed(pcRoomArr);
		return o;
	}
}
