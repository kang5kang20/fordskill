package com.ford.test;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ford.entity.user.FordAgentinfo;
import com.ford.service.user.IFordAgentinfoService;

@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration({"file:src/main/resources/spring-config.xml"})  
public class testfordagentinfo {
	
	@Autowired
	private IFordAgentinfoService fordagentinfoService;
	
	@Test
	public void testAdd(){
		try {
			DataInputStream in = new DataInputStream(new FileInputStream(new File("E:/私人文件/二手车代码交接/606.csv")));
			BufferedReader br= new BufferedReader(new InputStreamReader(in,"GBK"));
			 String line = null;  
			 int i = 1;
	            while((line=br.readLine())!=null){  
	                String item[] = line.split(",");//CSV格式文件为逗号分隔符文件，这里根据逗号切分 
	                FordAgentinfo fordAgentinfo = new FordAgentinfo();
	                fordAgentinfo.setRegion(item[0]);
	                fordAgentinfo.setAbbreviation(item[1]);
	                fordAgentinfo.setCode(item[2]);
	                fordagentinfoService.addInfo(fordAgentinfo);
	                System.out.println("添加第"+i+"条信息");
	                i++;
	            } 
	            System.out.println("读取完毕,总共读取:"+i+"条信息");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		String url = "http://127.0.0.1:8080/fordskill/fordexhibition/forwardAddc.act";
		String request = "";
		try {
			String json = HttpTestUtils.testHttpConnection(url, "POST", request);
			System.out.println(json);
		}catch(IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
