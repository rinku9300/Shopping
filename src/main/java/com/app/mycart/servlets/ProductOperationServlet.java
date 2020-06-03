package com.app.mycart.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.SessionFactory;

import com.app.mycart.dao.CategoryDao;
import com.app.mycart.dao.ProductDao;
import com.app.mycart.entities.Category;
import com.app.mycart.entities.Product;
import com.app.mycart.helper.FactroyProvider;

/**
 * Servlet implementation class ProductOperationServlet
 */

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private void processRequest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			
			String op=request.getParameter("operation");
			if(op.trim().equals("addCategory"))
			{
				//addCategory
				//Fetch category data
				String title=request.getParameter("catTitle");
				String description=request.getParameter("catDescription");
	  
				Category category=new Category();category.setCategoryTitle(title);
				category.setCategoryDescription(description);
				
				//category database save
				CategoryDao	categoryDao=new CategoryDao(FactroyProvider.getFactory());;
				
				int catId=categoryDao.saveCategory(category);
				//out.println("Category saved");
				
				//Saved message
				HttpSession httpSession=request.getSession();
				httpSession.setAttribute("message","Category added successfully: "+catId);
				response.sendRedirect("admin.jsp");
				return;
			}
			else if(op.trim().equals("addProduct"))
			{
			// addProduct	
				
				String pName=request.getParameter("pName");
				String pDesc=request.getParameter("pDesc");
				int pPrice=Integer.parseInt(request.getParameter("pPrice"));
				int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
				int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
				int catId=Integer.parseInt(request.getParameter("catId"));
				Part part=request.getPart("pPic");			
				Product p=new Product();				
				p.setpName(pName);
				p.setpDesc(pDesc);
				p.setpPrice(pPrice);
				p.pDiscount(pDiscount);
				p.setpQuantity(pQuantity);	
				p.setpPhoto(part.getSubmittedFileName());
				
				//get Category by id
				CategoryDao cdao=new CategoryDao(FactroyProvider.getFactory());
				Category category=cdao.getCategoryById(catId);
				
				p.setCategory(category);
				
				//product save...
				
				ProductDao pDao=new ProductDao(FactroyProvider.getFactory());
				pDao.SaveProduct(p);
				out.println("Product added successfully");
				//Saved message
				HttpSession httpSession=request.getSession();
				httpSession.setAttribute("message","Product added successfully: "+catId);
				response.sendRedirect("admin.jsp");
				
				//pic upload
				//findout the path to upload photo
			
				String path=request.getRealPath("img")+ File.separator+"products"+File.separator+part.getSubmittedFileName();
				System.out.println(path);
			
				//uploading code 
				try {
				FileOutputStream fos=new FileOutputStream(path); //send file
				InputStream is=part.getInputStream();
				
				//reading data
				
				//wring data
				
				byte[] data =new byte[is.available()];
				is.read(data);
				
				fos.write(data);
				fos.close();
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				
			}
			//Fetch category data
			String title=request.getParameter("catTitle");
			String description=request.getParameter("catDescription");
  
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
