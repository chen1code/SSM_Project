package com.erp.inter;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.erp.model.Book;
import com.erp.model.BorrowBookData;

public interface BookOperation {
	
	
	//addBook
	public int addBook(Book book);
	
	//uodateBook
	public int updateBook(Book book);
	
	//deleteBook
	public String deleteBook(int id);
	
	//getTotalNumber
	public int getTotalNumber();
	
	//selectBookListPage
	public List<Book> selectBookListPage(@Param("offset") int offset, @Param("limit") int limit);
	
	//借书数据插入
	public int borrowBookData(BorrowBookData borrowBookData);
	
	//模糊搜索返回的数据
	public List<Book> selectByAnyBook(Map<String, Object> searchBook);
	
	//我的借阅
	public List<BorrowBookData> selectMyBorrowBook(@Param("offset") int offset, @Param("limit") int limit,@Param("userAccount") String userAccount);
	
	//还书
	public String returnMyBorrowBook(@Param("userAccount") String userAccount, @Param("bookIsbn") String bookIsbn);
}
