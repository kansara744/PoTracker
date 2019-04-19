package Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Dao.ProjectDao;
import ServiceInterface.ProjectService;

@Controller
public class ProjectController {

	@Autowired
	public ProjectService projServ;
	
	String msg = "";
	
	
	
	@RequestMapping("/")
	public ModelAndView show(HttpServletRequest request,HttpSession session) { 
		ModelAndView mv=new ModelAndView(); 
		try {
		ArrayList<ProjectDao> listProject=projServ.getAllProject();
		//System.out.println(listProject);
		
		if(!msg.isEmpty()) {
			if(msg.equalsIgnoreCase("add_suc_msg")) {
				mv.addObject("suc_msg", "Project created Successfuly!");
				mv.addObject("type", "suc_msg");
			}else if(msg.equalsIgnoreCase("add_fail_msg")){
				mv.addObject("fail_msg", "Failed to create Project due to internal server error.");
				mv.addObject("type", "fail_msg");
			}
		}
		msg="";
		mv.addObject("projectList",listProject);
		mv.setViewName("project_admin");
		}catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	
	@RequestMapping(value="/addProject",method=RequestMethod.POST)
	public String addProject(HttpServletRequest request,ProjectDao project) {
		int result=0;
		try {
		result=projServ.InsertProject(project);
		if(result>0) {
			System.out.println(result);
		}
		}catch (Exception e) {
			System.out.println(e);
			msg="add_fail_msg";
		}
		
		msg = "add_suc_msg";
		return "redirect:/";
		
	}
	
	@RequestMapping("/project/view")
	public ModelAndView viewproject(HttpServletRequest request,@RequestParam("id") int id) {
		ModelAndView mv=new ModelAndView();
		ProjectDao projectinfo=null;
		ArrayList<ProjectDao> listview=new ArrayList<>();
		try {
			projectinfo=projServ.getProjectById(id);
			listview.add(projectinfo);
			mv.addObject("projectInfo",listview);
			mv.setViewName("viewproject");
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return mv;
	}
}
