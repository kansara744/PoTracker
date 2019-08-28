package Controller;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.directory.DirContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Dao.LoginDao;
import ServiceInterface.UsernameService;



@Controller
public class LoginController {

	private String msg="";
	
	@Autowired
	public UsernameService userServ;
	
	@RequestMapping("/login")
	public ModelAndView loginPage() {
		
		ModelAndView mv=new ModelAndView();
		if(msg!=null) {
			mv.addObject("msg",msg);
		}
		
		mv.setViewName("login");
		msg="";
		return mv;
	}
	
	
	@RequestMapping(value="/checkLogin",method=RequestMethod.POST)
	public String checkLogin(LoginDao loginCred,HttpServletRequest request) {
		
		boolean flag=userServ.checkUsername(loginCred.getUsername());
		//System.out.println("USername exists or not ! "+flag);
		if(flag) {
		//System.out.println(loginCred.getUsername()+" and password \t"+loginCred.getPassword());
		  Hashtable props = new Hashtable();
        //String principalName = "nishith.bhimani@elitecore.co.in";
		String principalName = loginCred.getUsername().trim()+"@elitecore.co.in";
		//System.out.println("principalname is "+principalName);
        props.put(Context.SECURITY_PRINCIPAL, principalName);
        String password=loginCred.getPassword();
       //props.put(Context.SECURITY_CREDENTIALS, "admin@20211");
        props.put(Context.SECURITY_CREDENTIALS, password);
        DirContext context;

            //try to authenticate
        try {

               context = com.sun.jndi.ldap.LdapCtxFactory.getLdapCtxInstance("ldap://dc.elitecore.co.in:389" + '/', props);
               context.close(); 
               HttpSession session = request.getSession();
               session.setAttribute("username", loginCred.getUsername());
               
        }
        catch(Exception ex)
        {
      	  System.out.println(ex.getMessage());
      	  msg="Invalid Login Credentials!";
      	return "redirect:/login";
        }
        }else {
        	msg="You are not Aurtorized User!";
        	return "redirect:/login";
        }
          
		
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public ModelAndView logOut(HttpServletResponse response,HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		
		HttpSession session = request.getSession(false);
		if(session != null)
		{
			session.invalidate();
		}
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		
		mv.addObject("msg","You have been successfully logged out.");
		mv.setViewName("/login");
		
		return mv;
	}
	
	
	
}
