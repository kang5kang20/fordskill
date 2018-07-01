package com.ford.controller.registration;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ford.dao.base.CallMapper;
import com.ford.entity.login.LoginSessionVO;
import com.ford.entity.login.LoginVO;
import com.ford.entity.skill.FordRegistration;
import com.ford.entity.skill.FordRegistrationExample;
import com.ford.entity.skill.FordRegistrationExample.Criteria;
import com.ford.entity.skill.FordRegistrationUserinfo;
import com.ford.entity.skill.FordRegistrationUsers;
import com.ford.entity.user.FordAgentinfo;
import com.ford.entity.user.FordAgentinfoExample;
import com.ford.service.skill.IFordRegisUserInfoService;
import com.ford.service.skill.IFordRegistrationService;
import com.ford.service.user.IFordAgentinfoService;
import com.ford.utils.DateUtil;

@Controller
@RequestMapping("/registration")
public class RegistrationController {
	@Autowired
	private IFordRegistrationService fordRegistrationService;
	
	@Autowired
	private IFordAgentinfoService fordagentinfoService;

	@Autowired
	private CallMapper callMapper;
	
	@Autowired
	private IFordRegisUserInfoService fordregisUserInfoService;
	
	/**
	 * 跳转报名
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/forwardRegistration")
	public String forwardRegistration(HttpServletRequest request,Model model) throws Exception {
		//获取登录session
		LoginSessionVO loginSessionVO =(LoginSessionVO) request.getSession().getAttribute("loginSessionVO");
		
		FordRegistrationExample fordRegistrationExample = new FordRegistrationExample();
		Criteria criteria = fordRegistrationExample.createCriteria();
		criteria.andCodeEqualTo(loginSessionVO.getAgentcode());
		criteria.andCodeEqualTo(loginSessionVO.getOpenid());
		List<FordRegistration> list = fordRegistrationService.findFordRegist(fordRegistrationExample);
		if(null != list && list.size()>0){
			//返回
			return "registration/chongfu";
		}
		FordAgentinfoExample fordAgentinfoExample = new FordAgentinfoExample();
		com.ford.entity.user.FordAgentinfoExample.Criteria criteriaagent = 
				fordAgentinfoExample.createCriteria();
		criteriaagent.andCodeEqualTo(loginSessionVO.getAgentcode());
		List<FordAgentinfo> agtlist = fordagentinfoService.selectFordInfoByCondition(fordAgentinfoExample);
		FordAgentinfo agent = agtlist.get(0);
		//设置uservo
		model.addAttribute("agent",agent);
		//返回
		return "registration/registration";
	}
	
	/**
	 * 报名
	 * @param request
	 * @param model
	 * @param users
	 * @param agent
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/addRegistration")
	public String addRegistration(HttpServletRequest request,Model model,
			FordRegistrationUsers fordRegistrationUsers,FordAgentinfo agent) throws Exception {
		//获取登录session
		LoginSessionVO loginSessionVO =(LoginSessionVO) request.getSession().getAttribute("loginSessionVO");
		//判断是否已经报名
		FordRegistrationExample fordRegistrationExample = new FordRegistrationExample();
		Criteria criteria = fordRegistrationExample.createCriteria();
		criteria.andCodeEqualTo(loginSessionVO.getAgentcode());
		criteria.andCodeEqualTo(loginSessionVO.getOpenid());
		List<FordRegistration> list = fordRegistrationService.findFordRegist(fordRegistrationExample);
		if(null != list && list.size()>0){
			//返回
			return "registration/chongfu";
		}
		//添加报名信息
		FordRegistration regis = new FordRegistration();
		regis.setAgentname(agent.getName());
		regis.setCode(agent.getCode());
		//获取登录session
		LoginSessionVO loginSessionVO =(LoginSessionVO) request.getSession().getAttribute("loginSessionVO");
		regis.setOpenid(loginSessionVO.getOpenid());
		regis.setRegion(agent.getRegion());
		regis.setTime(DateUtil.getCurrentTime());
		
		String regisid = callMapper.callFGetId();
		regis.setId(regisid);
		fordRegistrationService.addFordRegist(regis);
		
		for (int i = 0; i < fordRegistrationUsers.getUsers().size(); i++) {
			FordRegistrationUserinfo user = fordRegistrationUsers.getUsers().get(i);
			user.setCode(agent.getCode());
			user.setName(user.getName());
			user.setPhone(user.getPhone());
			user.setSex(user.getSex());
			user.setRegisid(regisid);
			fordregisUserInfoService.addFordRegisUsers(user);
		}
		
		return "registration/success";
	}
}	
