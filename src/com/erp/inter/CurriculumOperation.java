package com.erp.inter;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.erp.model.Curriculum;
import com.erp.model.School;
import com.erp.model.Specialty;
import com.erp.model.StudentCurriculum;

public interface CurriculumOperation {
	//add curriculum
	public int addCurriculum(Curriculum curriculum);
	//update curriculum
	public int updateCurriculum(Curriculum curriculum);
	
	//select from schools by schoolName
	public List<School> selectSchools();
	//select from specialties by toSchoolNumber
	public List<Specialty> selectSpecialties(String toSchoolNumber);
	//total
	public int selectCurriculumTotalCount();
	//分页
	public List<Curriculum> selectCurriculumListPage(@Param("offset") int offset, @Param("limit") int limit);
	//delete
	public String deleteCurriculumById(int id);
	
	
	//student choose curriculum
	public int chooseCurriculum(StudentCurriculum studentCurriculum);
	
	//myCurriculum total
	public int selectMyCurriculumTotal(String account);
	
	//myCurriculum 分页
	public List<StudentCurriculum> selectMyCurriculumListPage(@Param("offset") int offset, @Param("limit") int limit,@Param("account") String account);

	//根据selectByCurriculumNumber
	public List<Curriculum> selectByCurriculumNumber(List<StudentCurriculum> myCurriculum_list);

	//我的课表删除 deleteByCurriculumNumber
	public int deleteMyCurriculumByNumber(String curriculumNumber);
	
	
	//
	public List<Curriculum> selectCurriculumListPageByschoolNumber(@Param("offset") int offset, @Param("limit") int limit, @Param("schoolNumber") String schoolNumber);
	//查询所属学院的课程总数
	public int selectTotalBySchoolNumber(String schoolNumber);
	
	//模糊查询
	public List<Curriculum> selectByAnyCurriculum(Map<String, Object> curriculum_map);
}
