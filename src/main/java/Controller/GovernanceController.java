package Controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Dao.GovernanceDao;
import Dao.PODao;
import Dao.ProjectDao;
import ServiceInterface.GovernanceService;
import ServiceInterface.ProjectService;

@Controller
public class GovernanceController {

	@Autowired
	public ProjectService prodServ;

	@Autowired
	public GovernanceService govServ;

	String msg = "";
	@Value("${uploadedFolder}")
	String uploadedFolder;

	@Value("${fileURL}")
	String fileURL;

	@RequestMapping("/governance")
	public ModelAndView GovView() {

		ModelAndView mv = new ModelAndView();
		ArrayList<GovernanceDao> listGov = new ArrayList<>();
		ArrayList<ProjectDao> listProj = new ArrayList<>();

		try {
			listGov = govServ.getAllGoverance();
			listProj = prodServ.getAllProject();

			if (!msg.isEmpty()) {
				if (msg.equalsIgnoreCase("add_suc_msg")) {
					mv.addObject("suc_msg", "Governance created Successfuly!");
					mv.addObject("type", "suc_msg");
				} else if (msg.equalsIgnoreCase("add_fail_msg")) {
					mv.addObject("fail_msg", "Failed to create Governance due to internal server error.");
					mv.addObject("type", "fail_msg");
				} else if (msg.equalsIgnoreCase("update_suc_msg")) {
					mv.addObject("suc_msg", "Governance details updated Successfuly!");
					mv.addObject("type", "suc_msg");
				} else if (msg.equalsIgnoreCase("update_fail_msg")) {
					mv.addObject("fail_msg", "Failed to update Governance details due to internal server error.");
					mv.addObject("type", "fail_msg");
				}
			}
			msg = "";

			mv.addObject("projectList", listProj);
			mv.addObject("govList", listGov);

		} catch (Exception e) {
			// TODO: handle exception
		}

		mv.setViewName("Governance");
		return mv;
	}

	@RequestMapping(value = "/addGov", method = RequestMethod.POST)
	public String addGovernance(HttpServletRequest request, GovernanceDao gov, @RequestParam("file") MultipartFile file,
			RedirectAttributes redirectAttributes) {
		System.out.println("Governance object " + gov);
		int result = 0;
		try {
			if (gov.getProjectid() > 0) {
				ProjectDao pro = prodServ.getProjectById(gov.getProjectid());
				gov.setProjectname(pro.getProjectname());
			}
			Date date = new Date();
			String strDateFormat = "yyMMddhhmmss";
			DateFormat dateFormat = new SimpleDateFormat(strDateFormat);
			String formattedDate = dateFormat.format(date);

			if (!file.isEmpty()) {
				gov.setMom(formattedDate + "_" + file.getOriginalFilename().toString().trim());
			}
			result = govServ.addGoverance(gov);
			if (result > 0) {
				if (!file.isEmpty()) {
					byte[] bytes = file.getBytes();
					Path path = Paths.get(uploadedFolder + "mom/" + formattedDate + "_"
							+ file.getOriginalFilename().toString().trim());
					System.out.println("Path name is " + path);
					Files.write(path, bytes);
				}

			}

		} catch (Exception e) {
			System.out.println(e);
			msg = "add_fail_msg";
		}

		msg = "add_suc_msg";
		return "redirect:/governance";
	}

	@RequestMapping(value="/updateGov",method=RequestMethod.POST)
	public String updateGoo(HttpServletRequest request, GovernanceDao gov, @RequestParam("file") MultipartFile file,
			RedirectAttributes redirectAttributes) {
		int result = 0;
		boolean fileDelete = false;
		System.out.println("Gov Data "+gov);
		System.out.println("File data is "+file);
		
		try {
		GovernanceDao govDup=govServ.getGovernanceById(gov.getGvid());
		System.out.println("Duplicate data is "+govDup);
		gov.setProjectid(govDup.getProjectid());
		gov.setProjectname(govDup.getProjectname());
		gov.setCreatedate(govDup.getCreatedate());
		
		Date date = new Date();
		String strDateFormat = "yyMMddhhmmss";
		DateFormat dateFormat = new SimpleDateFormat(strDateFormat);
		String formattedDate = dateFormat.format(date);
		
		
		if (file.isEmpty()) {
			gov.setMom(govDup.getMom());
			//System.out.println("In setter POFILE");
		} else {
			File filedel = new File(uploadedFolder+"mom/" + govDup.getMom());
			if (filedel.exists()) {
				System.out.println("File patth is " + filedel);
				if (filedel.delete()) {
					fileDelete = true;
				}
			} else {
				fileDelete = true;
			}

		}
		if (fileDelete && !file.isEmpty()) {
			gov.setMom(formattedDate + "_" + file.getOriginalFilename().toString().trim());
			//System.out.println(po.getPofile());
		}
		System.out.println("After updating gov "+gov);
		result=govServ.updateGoverance(gov);
		if (result > 0) {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(uploadedFolder + "mom/" + formattedDate + "_" + file.getOriginalFilename().toString().trim());
			//System.out.println("Path name is " + path);
			Files.write(path, bytes);
		}
			
		}catch (Exception e) {
			System.out.println(e);
			msg = "update_fail_msg";
		}
		msg = "update_suc_msg";
		return "redirect:/governance";
	}
	
	@RequestMapping("/gov/view")
	public ModelAndView ViewGov(HttpServletRequest request, @RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		ArrayList<GovernanceDao> listGov = new ArrayList<>();
		GovernanceDao gov = null;
		try {
			gov = govServ.getGovernanceById(id);
			listGov.add(gov);

			mv.addObject("listGov", listGov);
			mv.addObject("FileDownloadURL", fileURL);
		} catch (Exception e) {
			System.out.println(e);
		}
		mv.setViewName("viewGovernance");
		return mv;

	}

}
