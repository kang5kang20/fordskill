package com.ford.controller.user;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ford.controller.user.comment.ExhibitionComment;
import com.ford.entity.exhibition.FordExhibitionSupplier;
import com.ford.entity.exhibition.FordExhibitionSupplierExample;
import com.ford.entity.exhibition.FordExhibitionSupplierExample.Criteria;
import com.ford.entity.exhibition.FordExhibitionUserinfo;
import com.ford.entity.user.FordAgentinfo;
import com.ford.entity.user.FordAgentinfoExample;
import com.ford.service.exhibition.IFordExhSupplierService;
import com.ford.service.exhibition.IFordExhUserinfoService;
import com.ford.service.user.IFordAgentinfoService;
import com.ford.utils.DateUtil;

@Controller
@RequestMapping("/fordexhibition")
public class ExhibitionCotroller {

	private Logger log = Logger.getLogger("error");

	@Autowired
	private IFordExhUserinfoService fordExhUserinfoService;

	@Autowired
	private IFordExhSupplierService fordExhSupplierService;

	@Autowired
	private IFordAgentinfoService fordagentinfoService;

	@RequestMapping(value = "/addExhibition.act")
	public ModelAndView addExhibition(FordExhibitionUserinfo fordExhibitionUserinfo) {
		ModelAndView modelAndView = new ModelAndView();
		boolean flag = false;
		// 判断时间是否过期
		if (null == fordExhibitionUserinfo.getCode() || "".equals(fordExhibitionUserinfo.getCode())
				|| null == fordExhibitionUserinfo.getName() || "".equals(fordExhibitionUserinfo.getName())
				|| null == fordExhibitionUserinfo.getPhone() || "".equals(fordExhibitionUserinfo.getPhone())) {
			modelAndView.setViewName("forward:/fordexhibition/forwardAdd.act");
			return modelAndView;
		}
		try {
			fordExhibitionUserinfo.setIswin("0");
			String time = DateUtil.getCurrentTiem();
			fordExhibitionUserinfo.setTime(time);
			fordExhUserinfoService.addUserinfo(fordExhibitionUserinfo);
		} catch (Exception e) {
			log.error(e.getMessage());
			try {
				FordAgentinfoExample fordAgentinfoExample = new FordAgentinfoExample();
				fordAgentinfoExample.createCriteria().andCityEqualTo(ExhibitionComment.EXH_ADDRESS);
				List<FordAgentinfo> list = fordagentinfoService.selectFordInfoByCondition(fordAgentinfoExample);
				modelAndView.addObject("fordagentlist", list);
			} catch (Exception e2) {
				log.error(e2.getMessage());
			}
			modelAndView.addObject("chongfuerror", 1).addObject("name", fordExhibitionUserinfo.getName())
					.addObject("phone", fordExhibitionUserinfo.getPhone())
					.addObject("code", fordExhibitionUserinfo.getCode());
			modelAndView.setViewName("/user/bm");
			return modelAndView;
		}
		if (DateUtil.compareToday(ExhibitionComment.EXH_ENDDATE)) {
			modelAndView.addObject("winflag", 0);
			modelAndView.setViewName("/user/win");
			return modelAndView;
		}
		// 抽奖
		int i = (int) (Math.random() * 100 + 1);
		log.error("电话号码:" + fordExhibitionUserinfo.getPhone() + "======抽奖号码；" + i);
		try {
			if (i <= 20) {
				Map<String, Object> map = new HashMap<>();
				map.put("id", fordExhibitionUserinfo.getId());
				map.put("iswin", "1");
				// 查询中奖数量是否超过5次
				FordExhibitionSupplierExample fordExhibitionSupplierExample = new FordExhibitionSupplierExample();
				Criteria criteria = fordExhibitionSupplierExample.createCriteria();
				criteria.andCodeEqualTo(fordExhibitionUserinfo.getCode());
				List<FordExhibitionSupplier> list = fordExhSupplierService
						.queryFordExhSupplierBycondition(fordExhibitionSupplierExample);
				if (null != list && list.size() > 0) {
					// 更新中奖信息
					FordExhibitionSupplier fordExhibitionSupplier = list.get(0);
					if (fordExhibitionSupplier.getCount() < 5) {
						// 更新中奖信息
						int count = fordExhibitionSupplier.getCount() + 1;
						map.put("count", count);
						map.put("code", fordExhibitionSupplier.getCode());
						fordExhSupplierService.updateFordExhSupplierWinCount(map);
						flag = true;
					}
				} else {
					FordExhibitionSupplier fordExhibitionSupplier = new FordExhibitionSupplier();
					fordExhibitionSupplier.setCode(fordExhibitionUserinfo.getCode());
					fordExhibitionSupplier.setCount(1);
					fordExhSupplierService.addFordExhSupplier(fordExhibitionSupplier);
					fordExhUserinfoService.updateUserinfoWinByKey(map);
					flag = true;
				}
			}
		} catch (Exception e) {
			flag = false;
			log.error("未中奖:" + e.getMessage());
		}
		if (flag) {
			modelAndView.addObject("winflag", 1);
			modelAndView.setViewName("/user/win");
		} else {
			modelAndView.addObject("winflag", 0);
			modelAndView.setViewName("/user/win");
		}
		return modelAndView;
	}

	@RequestMapping(value = "/forwardAddc.act")
	public void forwardAddc() throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		try {
			DataInputStream in = new DataInputStream(new FileInputStream(new File("E:/私人文件/二手车代码交接/606.csv")));
			BufferedReader br = new BufferedReader(new InputStreamReader(in, "GBK"));
			List<FordAgentinfo> list = new ArrayList<>();
			String line = null;
			int i = 1;
			while ((line = br.readLine()) != null) {
				String item[] = line.split(",");// CSV格式文件为逗号分隔符文件，这里根据逗号切分
				FordAgentinfo fordAgentinfo = new FordAgentinfo();
				fordAgentinfo.setRegion(item[0]);
				fordAgentinfo.setAbbreviation(item[1]);
				fordAgentinfo.setName(item[1]);
				fordAgentinfo.setCode(item[2]);
				fordagentinfoService.addInfo(fordAgentinfo);
				System.out.println("添加第" + i + "条信息");
				list.add(fordAgentinfo);
				i++;
			}
			System.out.println("读取完毕,总共读取:" + i + "条信息");
		} catch (Exception e) {
			e.printStackTrace();
		}
		// return modelAndView;
	}

	@RequestMapping(value = "/forwardAdd.act")
	public ModelAndView forwardAdd() throws Exception {
		String city = ExhibitionComment.EXH_ADDRESS;
		ModelAndView modelAndView = new ModelAndView();
		FordAgentinfoExample fordAgentinfoExample = new FordAgentinfoExample();
		fordAgentinfoExample.createCriteria().andCityEqualTo(city);
		List<FordAgentinfo> list = fordagentinfoService.selectFordInfoByCondition(fordAgentinfoExample);
		modelAndView.addObject("fordagentlist", list);
		modelAndView.setViewName("/user/bm");
		return modelAndView;
	}

	@RequestMapping(value = "/forwardAddUser.act")
	public ModelAndView forwardAddUser(FordExhibitionUserinfo fordExhibitionUserinfo) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/tg");
		return modelAndView;
	}

	@RequestMapping(value = "/addExhibitionUser.act")
	public ModelAndView addExhibitionUser(FordExhibitionUserinfo fordExhibitionUserinfo) {
		ModelAndView modelAndView = new ModelAndView();
		boolean flag = false;
		// 判断时间是否过期
		if (null == fordExhibitionUserinfo.getCode() || "".equals(fordExhibitionUserinfo.getCode())
				|| null == fordExhibitionUserinfo.getName() || "".equals(fordExhibitionUserinfo.getName())
				|| null == fordExhibitionUserinfo.getPhone() || "".equals(fordExhibitionUserinfo.getPhone())
				|| null == fordExhibitionUserinfo.getCity() || "".equals(fordExhibitionUserinfo.getCity())
				|| null == fordExhibitionUserinfo.getSupplier() || "".equals(fordExhibitionUserinfo.getSupplier())) {
			modelAndView.setViewName("forward:/fordexhibition/forwardAddUser.act");
			return modelAndView;
		}
		try {
			fordExhibitionUserinfo.setIswin("0");
			String time = DateUtil.getCurrentTiem();
			fordExhibitionUserinfo.setTime(time);
			fordExhUserinfoService.addUserinfo(fordExhibitionUserinfo);
		} catch (Exception e) {
			modelAndView.addObject("chongfuerror", 1).addObject("name", fordExhibitionUserinfo.getName())
					.addObject("phone", fordExhibitionUserinfo.getPhone())
					.addObject("code", fordExhibitionUserinfo.getCode());
			modelAndView.setViewName("/user/tg");
			return modelAndView;
		}
		if (DateUtil.compareToday(ExhibitionComment.EXH_ENDDATE)) {
			modelAndView.addObject("winflag", 0);
			modelAndView.setViewName("/user/tgwin");
			return modelAndView;
		}
		// 抽奖
		int i = (int) (Math.random() * 100 + 1);
		log.error("电话号码:" + fordExhibitionUserinfo.getPhone() + "======抽奖号码；" + i);
		try {
			if (i <= 10) {
				Map<String, Object> map = new HashMap<>();
				map.put("id", fordExhibitionUserinfo.getId());
				map.put("iswin", "1");
				// 查询中奖数量是否超过5次
				FordExhibitionSupplierExample fordExhibitionSupplierExample = new FordExhibitionSupplierExample();
				Criteria criteria = fordExhibitionSupplierExample.createCriteria();
				criteria.andCodeEqualTo(fordExhibitionUserinfo.getCode());
				List<FordExhibitionSupplier> list = fordExhSupplierService
						.queryFordExhSupplierBycondition(fordExhibitionSupplierExample);
				if (null != list && list.size() > 0) {
					// 更新中奖信息
					FordExhibitionSupplier fordExhibitionSupplier = list.get(0);
					if (fordExhibitionSupplier.getCount() < 5) {
						// 更新中奖信息
						int count = fordExhibitionSupplier.getCount() + 1;
						map.put("count", count);
						map.put("code", fordExhibitionSupplier.getCode());
						fordExhSupplierService.updateFordExhSupplierWinCount(map);
						fordExhUserinfoService.updateUserinfoWinByKey(map);
						flag = true;
					}
				} else {
					FordExhibitionSupplier fordExhibitionSupplier = new FordExhibitionSupplier();
					fordExhibitionSupplier.setCode(fordExhibitionUserinfo.getCode());
					fordExhibitionSupplier.setCount(1);
					fordExhSupplierService.addFordExhSupplier(fordExhibitionSupplier);
					fordExhUserinfoService.updateUserinfoWinByKey(map);
					flag = true;
				}
			}
		} catch (Exception e) {
			flag = false;
			log.error("未中奖:" + e.getMessage());
		}
		if (flag) {
			modelAndView.addObject("winflag", 1);
			modelAndView.setViewName("/user/tgwin");
		} else {
			modelAndView.addObject("winflag", 0);
			modelAndView.setViewName("/user/tgwin");
		}
		return modelAndView;
	}
}
