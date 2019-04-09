package com.erp.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.erp.model.Users;

public interface IUserOperation {
	 
//	 public List<Article> selectArticleListPage(@Param("page") PageInfo page,@Param("userid") int userid);
	 public Users selectUserByAccountName(String account);
	 public int addUsers(Users users);
	 public List<Users> getAllUsers();
	 public int updateUsers(Users users);
	 public String deleteUserByAccountName(String account);
	 public int selectTotalCount();
	 public List<Users> selectUsersListPage(@Param("offset") int offset, @Param("limit") int limit);
	public String deleteUserById(String id);
	
	//查询学院名bySchoolNumber
	public String selectBySchoolNumber(String toSchoolName);
	//查询学院代号byAccount
	public String selectSchoolByAccount(String account);
	
	//模糊查询
	public List<Users> selectByAny(@Param("offset") int offset, @Param("limit") int limit, @Param("userName") String userName,@Param("toSchoolNumber") String toSchoolNumber,@Param("user_type") String user_type);
	//模糊查询总数
	public int selectTotalSearchCount(Users users);
	
	
	//临时应对措施  上传头像
	public int updateImg(Users user);
}
