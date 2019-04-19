package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class DashboardController {
	

	@RequestMapping(value = "/MOM")
	public String show(){
		return "index";
	}
	
	

}
