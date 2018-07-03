package com.ford.controller.exam;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ford.controller.exam.vo.CallBackVO;
import com.ford.controller.exam.vo.CallVOUtil;
import com.ford.controller.user.comment.ExampleComment;
import com.ford.entity.skill.FordRegistration;
import com.ford.entity.skill.FordRegistrationExample;
import com.ford.entity.user.FordUserinfoExam;
import com.ford.service.skill.IFordRegistrationService;
import com.ford.service.user.IFordUserExamService;
import com.ford.utils.DateUtil;

@Controller
@RequestMapping("/exam")
public class FordExamController {

	private Logger log = Logger.getLogger("error");
	
	@Autowired
	private IFordRegistrationService fordregistrationService;
	
	@Autowired
	private IFordUserExamService fordUserExamService;
	
	@RequestMapping(value = "/forwardExam.act")
	public String forwardExam(HttpServletRequest request){
		if (!DateUtil.compareToday(ExampleComment.EXAM_START_TIME)) {
			//返回来早了，还没有开始界面
			
			return "";
		}
		if (DateUtil.compareToday(ExampleComment.EXAM_END_TIME)) {
			//返回考试已经结束界面
			return "";
		}
		String openid ;
		if (null==request.getSession().getAttribute("openid")||"".equals(request.getSession().getAttribute("openid"))) {
			//返回登录页面
			
			return "";
		}else {
			try {
				openid = request.getSession().getAttribute("openid").toString();
				FordRegistrationExample fordRegistrationExample = new FordRegistrationExample();
				fordRegistrationExample.createCriteria().andOpenidEqualTo(openid);
				List<FordRegistration> list = fordregistrationService.findFordRegist(fordRegistrationExample); 
				if (null==list||list.size()<=0) {
					//不是报名用户
					return "";
				}else{
					//进入考试链接
					return "redirect:"+ExampleComment.EXAM_EXAMADDRESS +openid;
				}
			} catch (Exception e) {
				log.error(e.getMessage());
				return "";
			}
			
		}
	}
	
	@RequestMapping(value = "/callback.act")
	public void callback(HttpServletRequest request){
		CallVOUtil callVOUtil = new CallVOUtil();
		try {
			String json = IOUtils.toString(request.getInputStream());
			log.error("===回调json串===="+json);
			ObjectMapper om = new ObjectMapper();
			CallBackVO callBackVO = om.readValue(json, CallBackVO.class);
			FordUserinfoExam fordUserinfoExam = callVOUtil.callVO2Exam(callBackVO);
			fordUserExamService.addFordUserExam(fordUserinfoExam);
		} catch (Exception e) {
			log.error("===回调报错了=========="+e.getMessage());
		}
	}
	
	
}
