package com.DAO;

import java.util.List;

import com.entity.bookdtls;

public interface bookDAO {

	public boolean addbook(bookdtls b);

	public List getallbooks();

	public bookdtls getbookbyid(int id);


	public boolean updatebookdtls(bookdtls b);

	public boolean bookDelete(int id);

	public List<bookdtls> Newbooks();

	public List<bookdtls> Recentbooks();

	public List<bookdtls> Oldbooks();

	public List<bookdtls> getAllNewBooks();

	public List<bookdtls> getAllRecentBooks();

	public List<bookdtls> getAllOldBooks();

	public List<bookdtls> getOldBook(String email,String bcategory);

	public boolean deleteOldBook(int bid,String email,String bcategory);


	public boolean updateOldbookdtls(bookdtls b);


	public List<bookdtls> getbookbychar(String ch);

}
