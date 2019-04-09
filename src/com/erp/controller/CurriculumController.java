package com.erp.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erp.inter.CurriculumOperation;
import com.erp.inter.IUserOperation;
import com.erp.model.Curriculum;
import com.erp.model.News;
import com.erp.model.School;
import com.erp.model.Specialty;
import com.erp.model.StudentCurriculum;
import com.erp.util.JsonResult;
import com.erp.util.SplitPageResult;

@Controller
public class CurriculumController {
	
	@Autowired
    CurriculumOperation curriculumMapper;
	@Autowired
	IUserOperation userMapper;
	//curriculumPublish
	@RequestMapping(value="/curriculumPublish",method = RequestMethod.GET)
    public String curriclumPublish() {
    	return "curriculumPublish";
	}
	@RequestMapping(value="/allSchools",method = RequestMethod.GET)
	@ResponseBody
    public List<School> selectSchools() {
		List<School> schools = curriculumMapper.selectSchools();
    	return schools;
	}
	@RequestMapping(value="/selectedSpecialties",method = RequestMethod.POST)
	@ResponseBody
    public List<Specialty> selectedSpecialties(HttpServletRequest request) {
		String toSchoolNumber = request.getParameter("toSchoolNumber");
		List<Specialty> specialties = curriculumMapper.selectSpecialties(toSchoolNumber);
    	return specialties;
	}
	//addCurriculum
	@RequestMapping(value="/addCurriculum",method = RequestMethod.POST)
	@ResponseBody
	public JsonResult addCurriculum(Curriculum curriculum, HttpServletRequest request) {
		JsonResult jr = new JsonResult();
		
		int re = curriculumMapper.addCurriculum(curriculum);
		if(re == 1) {
			jr.setErrcode("200");
			jr.setMessage("新增课程成功");
		}else {
			jr.setErrcode("404");
			jr.setMessage("新增课程失败");
		}
		return null;
		
	}
	
	//curriculum list
	@RequestMapping(value="/curriculumList",method = RequestMethod.GET)
	public String curriculumList() {
		return "curriculumList";
	}
	@RequestMapping(value="/curriculumsList",method = RequestMethod.POST)
	@ResponseBody
	public SplitPageResult<List<Curriculum>> curriculumList(HttpServletRequest request) {
    	//获取参数
    	int offset = Integer.parseInt(request.getParameter("offset"));
    	int limit = Integer.parseInt(request.getParameter("limit"));
    	//获取学院代号
    	HttpSession session = request.getSession(false);
    	String account = (String)session.getAttribute("account");
    	String schoolNumber = userMapper.selectSchoolByAccount(account);
    	//查询数据
    	List<Curriculum> curriculum_list;
    	int total;
    	//获取课程列表查询参数
    	String curriculumNumber = request.getParameter("curriculumNumber");
    	String curriculumType = request.getParameter("curriculumType");
    	String curriculumName = request.getParameter("curriculumName");
    	if(limit == 100) {
    		curriculum_list = curriculumMapper.selectCurriculumListPageByschoolNumber(offset,limit,schoolNumber);
    		total = curriculumMapper.selectTotalBySchoolNumber(schoolNumber);
    	}else if(curriculumNumber != "" || curriculumType != ""  || curriculumName != "") {
    		HashMap<String, Object> curriculum_map = new HashMap<String, Object>();
    		curriculum_map.put("curriculumNumber", curriculumNumber);
    		curriculum_map.put("curriculumType", curriculumType);
    		curriculum_map.put("curriculumName", curriculumName);
    		curriculum_map.put("limit", limit);
    		curriculum_map.put("offset", offset);
    		curriculum_list = curriculumMapper.selectByAnyCurriculum(curriculum_map);
    		total = curriculum_list.size();
    	}else{
    		curriculum_list = curriculumMapper.selectCurriculumListPage(offset,limit);
    		total = curriculumMapper.selectCurriculumTotalCount();
    	}
    	//返回数据
    	SplitPageResult<List<Curriculum>> split_result = new SplitPageResult<List<Curriculum>>();
    	
    	split_result.setPage(offset/limit+1);
    	split_result.setTotal(total);
    	split_result.setRows(curriculum_list);
    	
		return split_result;
    }
	
	//update curriculum
	@RequestMapping(value="/updateCurriculum",method = RequestMethod.POST)
	@ResponseBody
	public JsonResult updateCurriculum(Curriculum curriculum, HttpServletRequest request) {
		JsonResult jr = new JsonResult();
		int id = Integer.parseInt(request.getParameter("id"));
		curriculum.setId(id);
		int re = curriculumMapper.updateCurriculum(curriculum);
		if(re == 1) {
			jr.setErrcode("200");
			jr.setMessage("新增课程成功");
		}else {
			jr.setErrcode("404");
			jr.setMessage("新增课程失败");
		}
		return jr;
		
	}
	
	//delete curriculum
	@RequestMapping(value="/deleteCurriculum",method = RequestMethod.POST)
	@ResponseBody
	public JsonResult deleteCurriculum(HttpServletRequest request) {
		JsonResult jr = new JsonResult();
		int id = Integer.parseInt(request.getParameter("id"));
		String re = curriculumMapper.deleteCurriculumById(id);
		if(re == null) {
			jr.setErrcode("200");
			jr.setMessage("删除课程成功");
		}else {
			jr.setErrcode("404");
			jr.setMessage("删除课程失败");
		}
		return jr;
	}
	//chooseCurriculum
	@RequestMapping(value="/myCurriculumList",method = RequestMethod.GET)
	public String myCurriculumList(HttpServletRequest request,HttpServletResponse response) throws IOException {
		return "myCurriculumList";
	}
	@RequestMapping(value="/chooseCurriculum",method = RequestMethod.POST)
	@ResponseBody
	public JsonResult chooseCruuiculum(@RequestBody StudentCurriculum[] studentCurriculum,HttpServletRequest request) {
		JsonResult jr = new JsonResult();
		StudentCurriculum stuC = new StudentCurriculum();
		for(StudentCurriculum studentCurriculum1 : studentCurriculum) {
			stuC.setStudentNumber(studentCurriculum1.getStudentNumber());
			stuC.setCurriculumNumber(studentCurriculum1.getCurriculumNumber());
			curriculumMapper.chooseCurriculum(stuC);
		}
		jr.setErrcode("200");
		jr.setMessage("删除课程成功");
		
		return jr;
	}
	//myCurriculumList
	@RequestMapping(value="/myCurriculumsList",method = RequestMethod.GET)
	@ResponseBody
	public SplitPageResult<List<Curriculum>> myCurriculumsList(HttpServletRequest request) {
    	//获取参数
    	int offset = Integer.parseInt(request.getParameter("offset"));
    	int limit = Integer.parseInt(request.getParameter("limit"));
    	HttpSession session = request.getSession(false);
    	String account = (String) session.getAttribute("account");
    	//查询数据
    	List<StudentCurriculum> myCurriculum_list = curriculumMapper.selectMyCurriculumListPage(offset,limit,account);
    	//返回数据
    	SplitPageResult<List<Curriculum>> split_result = new SplitPageResult<List<Curriculum>>();
    	//根据课程号查找课程表得到相关数据
    	List<Curriculum> myCurriculum = curriculumMapper.selectByCurriculumNumber(myCurriculum_list);
    	
    	int total = curriculumMapper.selectMyCurriculumTotal(account);
    	split_result.setPage(offset/limit+1);
    	split_result.setTotal(total);
    	split_result.setRows(myCurriculum);
    	
		return split_result;
    }
	
	//deleteMycurriculum
	@RequestMapping(value="/deleteMyCurriculum",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult deleteMyCurriculum(HttpServletRequest request) {
		JsonResult jr = new JsonResult();
		String curriculumNumber = request.getParameter("curriculumNumber");
		int re = curriculumMapper.deleteMyCurriculumByNumber(curriculumNumber);
		if(re == 1) {
			jr.setErrcode("200");
			jr.setMessage("删除课程成功");
		}else {
			jr.setErrcode("404");
			jr.setMessage("删除课程失败");
		}
		return jr;
	}
}
