package req;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private Map<String, Handler> map = new HashMap<>();
	
	
    @Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
    	Properties prop = new Properties();
    	
    	String path = this.getServletContext().getRealPath("/WEB-INF/commands.properties");
    	try {
			prop.load(new FileReader(path));
			Iterator iter= prop.keySet().iterator();
			
			while(iter.hasNext()) {
				String url = (String)iter.next();
				String className = prop.getProperty(url);
				System.out.println(url+"/"+className);
				
				Class<?> handlerClass = Class.forName(className);
				Constructor<?> cons = handlerClass.getConstructor(null);
				Handler handler = (Handler) cons.newInstance();
				map.put(url, handler);
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
	}

	/**
     * @see HttpServlet#HttpServlet()
     */
    public DispatcherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = request.getServletPath();
		String view = null;
		
		Handler handler = map.get(url);
		
		if(handler != null) {
			view = handler.process(request, response);
			if(view != null) {
				if(view.startsWith("redirect")) {
					String[] path = view.split(":");
					response.sendRedirect(request.getContextPath()+path[1]);
				} else if(view.startsWith("responsebody")) {
					String[] path = view.split("/");
					response.getWriter().append(path[1]);
				} else {
					RequestDispatcher dis = request.getRequestDispatcher(view);
					dis.forward(request, response);
				}
			}
		} else {
			response.getWriter().append("404 not found url");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
