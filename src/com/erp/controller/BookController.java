package com.erp.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erp.inter.BookOperation;
import com.erp.model.Book;
import com.erp.model.BorrowBookData;
import com.erp.util.JsonResult;
import com.erp.util.SplitPageResult;

@Controller
public class BookController {

	@Autowired
	BookOperation bookMapper;
	
	//addBook
	@RequestMapping(value="/addBook", method=RequestMethod.GET)
	public String addBook() {
		return "addBook";
	}
	
	@RequestMapping(value="addBook", method=RequestMethod.POST)
	@ResponseBody
	public JsonResult addBook(Book book, HttpServletRequest request) {
		JsonResult jr = new JsonResult();
		int re = bookMapper.addBook(book);
		if(re == 1) {
			jr.setErrcode("200");
			jr.setMessage("新增课程成功");
		}else {
			jr.setErrcode("404");
			jr.setMessage("新增课程失败");
		}
		
		return jr;
	}
	
	//book list
		@RequestMapping(value="/bookList",method = RequestMethod.GET)
		public String curriculumList() {
			return "bookList";
		}
		@RequestMapping(value="/booksList",method = RequestMethod.POST)
		@ResponseBody
		public SplitPageResult<List<Book>> curriculumList(HttpServletRequest request) {
	    	//获取参数
	    	int offset = Integer.parseInt(request.getParameter("offset"));
	    	int limit = Integer.parseInt(request.getParameter("limit"));
	    	List<Book> book_list;
	    	int total;
	    	//获取搜索参数
	    	String bookType = request.getParameter("bookType");
	    	String isbn = request.getParameter("isbn");
	    	String bookName = request.getParameter("bookName");
	    	HashMap<String, Object> search_book = new HashMap<String, Object>();
	    	//判断是否调用搜索部分
	    	if(bookType != "" || isbn != "" || bookName != "") {
	    		search_book.put("bookType",bookType);
	    		search_book.put("isbn", isbn);
	    		search_book.put("bookName", bookName);
	    		search_book.put("limit", limit);
	    		search_book.put("offset", offset);
	    		book_list = bookMapper.selectByAnyBook(search_book);
	    		total = book_list.size();
	    	}
	    	//无搜索参数查询数据
	    	else {
	    		book_list = bookMapper.selectBookListPage(offset,limit);
	    		total = bookMapper.getTotalNumber();
	    	}
	    	//返回数据填充
	    	SplitPageResult<List<Book>> split_result = new SplitPageResult<List<Book>>();
	    	
	    	split_result.setPage(offset/limit+1);
	    	split_result.setTotal(total);
	    	split_result.setRows(book_list);
	    	
			return split_result;
	    }
	//update book
		@RequestMapping(value="/updateBook",method = RequestMethod.POST)
		@ResponseBody
		public JsonResult updateBook(Book book, HttpServletRequest request) {
			JsonResult jr = new JsonResult();
			int id = Integer.parseInt(request.getParameter("id"));
			book.setId(id);
			int re = bookMapper.updateBook(book);
			if(re == 1) {
				jr.setErrcode("200");
				jr.setMessage("修改信息成功");
			}else {
				jr.setErrcode("404");
				jr.setMessage("修改信息失败");
			}
			return jr;
			
		}
		
		//delete curriculum
		@RequestMapping(value="/deleteBook",method = RequestMethod.POST)
		@ResponseBody
		public JsonResult deleteBook(HttpServletRequest request) {
			JsonResult jr = new JsonResult();
			int id = Integer.parseInt(request.getParameter("id"));
			String re = bookMapper.deleteBook(id);
			if(re == null) {
				jr.setErrcode("200");
				jr.setMessage("删除课程成功");
			}else {
				jr.setErrcode("404");
				jr.setMessage("删除课程失败");
			}
			return jr;
		}
		
		
		//借书
		@RequestMapping(value="/borrowBook",method = RequestMethod.POST)
		@ResponseBody
		public JsonResult borrowBook(HttpServletRequest request) {
			JsonResult jr = new JsonResult();
			BorrowBookData borrowBook = new BorrowBookData();
			HttpSession session = request.getSession(false);
			String userAccount = (String) session.getAttribute("account");
			String bookIsbn = request.getParameter("bookIsbn");
			String bookName = request.getParameter("bookName");
			Date date = new Date();
			DateFormat df = DateFormat.getDateTimeInstance();
			borrowBook.setUserAccount(userAccount);
			borrowBook.setBookIsbn(bookIsbn);
			borrowBook.setBookName(bookName);
			borrowBook.setBorrowDate(df.format(date));
			int re = bookMapper.borrowBookData(borrowBook);
			
			return jr;
		}
		
		//我的借阅列表
		@RequestMapping(value="/myBorrowBook",method = RequestMethod.GET)
		public String myBorrowBook() {
			return "myBorrowBook";
		}
		@RequestMapping(value="/myBorrowBookList",method = RequestMethod.POST)
		@ResponseBody
		public SplitPageResult<List<BorrowBookData>> myBorrowBookList(HttpServletRequest request) {
	    	//获取参数
	    	int offset = Integer.parseInt(request.getParameter("offset"));
	    	int limit = Integer.parseInt(request.getParameter("limit"));
	    	HttpSession session = request.getSession(false);
			String userAccount = (String) session.getAttribute("account");
	    	List<BorrowBookData> borrowBook_list;
	    	int total;
	    	borrowBook_list = bookMapper.selectMyBorrowBook(offset,limit,userAccount);
	    	total = bookMapper.getTotalNumber();
	    	
	    	//返回数据填充
	    	SplitPageResult<List<BorrowBookData>> split_result = new SplitPageResult<List<BorrowBookData>>();
	    	//修改数据库取出的时间数据带.0的问题
	    	for(int i = 0; i < borrowBook_list.size(); i++) {
	    		String date = borrowBook_list.get(i).getBorrowDate();
	    		borrowBook_list.get(i).setBorrowDate(date.replace(".0", ""));
	    	}
	    	split_result.setPage(offset/limit+1);
	    	split_result.setTotal(total);
	    	split_result.setRows(borrowBook_list);
	    	
			return split_result;
	    }
		//还书
		@RequestMapping(value="/returnBook",method = RequestMethod.POST)
		@ResponseBody
		public JsonResult returnBook(HttpServletRequest request) {
			JsonResult jr = new JsonResult();
			HttpSession session = request.getSession(false);
			String userAccount = (String) session.getAttribute("account");
			String bookIsbn = request.getParameter("bookIsbn");
			String re = bookMapper.returnMyBorrowBook(userAccount, bookIsbn);
			if(re == null) {
				jr.setErrcode("200");
				jr.setMessage("删除课程成功");
			}else {
				jr.setErrcode("404");
				jr.setMessage("删除课程失败");
			}
			return jr;
		} 
		
}
