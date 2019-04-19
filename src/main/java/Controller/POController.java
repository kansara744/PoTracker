package Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Dao.PODao;
import Dao.ProjectDao;
import ServiceInterface.POService;
import ServiceInterface.ProjectService;

@Controller
public class POController {

	@Autowired
	public ProjectService prodServ;

	@Autowired
	public POService poServ;

	String msg = "";
	@Value("${uploadedFolder}")
	String uploadedFolder;
	
	@Value("${fileURL}")
	String fileURL;

	// private static String UPLOADED_FOLDER =
	// "/home/eliteaaa/Application/SterliteTechMOM/POFile/";

	@RequestMapping("/potracker")
	public ModelAndView PoView() {

		ModelAndView mv = new ModelAndView();
		ArrayList<ProjectDao> listProject = new ArrayList<>();
		ArrayList<PODao> listPO = new ArrayList<>();
		try {
			listProject = prodServ.getAllProject();
			listPO = poServ.getAllPO();

			if (!msg.isEmpty()) {
				if (msg.equalsIgnoreCase("add_suc_msg")) {
					mv.addObject("suc_msg", "PO created Successfuly!");
					mv.addObject("type", "suc_msg");
				} else if (msg.equalsIgnoreCase("add_fail_msg")) {
					mv.addObject("fail_msg", "Failed to create PO due to internal server error.");
					mv.addObject("type", "fail_msg");
				} else if (msg.equalsIgnoreCase("update_suc_msg")) {
					mv.addObject("suc_msg", "PO details updated Successfuly!");
					mv.addObject("type", "suc_msg");
				} else if (msg.equalsIgnoreCase("update_fail_msg")) {
					mv.addObject("fail_msg", "Failed to update PO details due to internal server error.");
					mv.addObject("type", "fail_msg");
				}
			}
			msg = "";

			mv.addObject("projectList", listProject);
			mv.addObject("polist", listPO);
		} catch (Exception e) {
			// TODO: handle exception
		}

		mv.setViewName("PO");
		return mv;
	}

	@RequestMapping(value = "/addPO", method = RequestMethod.POST)
	public String addPo(HttpServletRequest request, PODao po, @RequestParam("file") MultipartFile file,
			RedirectAttributes redirectAttributes) throws IOException {
		int result = 0;
		// System.out.println("PO "+po);
		try {
			if (po.getProjectid() > 0) {
				ProjectDao proj = prodServ.getProjectById(po.getProjectid());
				// System.out.println("POject dao "+proj.getProjectname());
				po.setProjectname(proj.getProjectname());
				// System.out.println("PO get project name "+po.getProjectname());
			}
			Date date = new Date();
			String strDateFormat = "yyMMddhhmmss";
			DateFormat dateFormat = new SimpleDateFormat(strDateFormat);
			String formattedDate = dateFormat.format(date);
			if (!file.isEmpty()) {
				po.setPofile(formattedDate + "_" + po.getPonumber().trim() + "_"
						+ file.getOriginalFilename().toString().trim());
			}
			result = poServ.addPO(po);
			if (result > 0) {
				if (!file.isEmpty()) {
					byte[] bytes = file.getBytes();
					Path path = Paths.get(uploadedFolder + "po/" + formattedDate + "_" + po.getPonumber().trim() + "_"
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
		return "redirect:/potracker";
	}

	@RequestMapping(value = "/updatePo", method = RequestMethod.POST)
	public String updatePo(HttpServletRequest request, PODao po, @RequestParam("file") MultipartFile file,
			RedirectAttributes redirectAttributes) {
		int result = 0;
		boolean fileDelete = false;
		try {
			//System.out.println("PO Data is " + po);
			PODao poDup = poServ.getPOByID(po.getPoid());
			//System.out.println("PODup Details is " + poDup);
			po.setProjectid(poDup.getProjectid());
			po.setProjectname(poDup.getProjectname());
			po.setCreatedate(poDup.getCreatedate());

			Date date = new Date();
			String strDateFormat = "yyMMddhhmmss";
			DateFormat dateFormat = new SimpleDateFormat(strDateFormat);
			String formattedDate = dateFormat.format(date);
			if (file.isEmpty()) {
				po.setPofile(poDup.getPofile());
				//System.out.println("In setter POFILE");
			} else {
				File filedel = new File(uploadedFolder+"po/" + poDup.getPofile());
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
				po.setPofile(formattedDate + "_" + po.getPonumber().trim() + "_"
						+ file.getOriginalFilename().toString().trim());
				//System.out.println(po.getPofile());
			}

			result = poServ.updatePO(po.getPoid(), po);
			if (result > 0) {
				byte[] bytes = file.getBytes();
				Path path = Paths.get(uploadedFolder + "po/" + formattedDate + "_" + po.getPonumber().trim() + "_"
						+ file.getOriginalFilename().toString().trim());
				//System.out.println("Path name is " + path);
				Files.write(path, bytes);
			}

		} catch (Exception e) {
			System.out.println(e);
			msg = "update_fail_msg";
		}

		msg = "update_suc_msg";
		return "redirect:/potracker";
	}

	@RequestMapping("/po/view")
	public ModelAndView viewPO(HttpServletRequest request, @RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		PODao po = null;
		ArrayList<PODao> listPo = new ArrayList<>();
		try {
			po = poServ.getPOByID(id);
			listPo.add(po);
			mv.addObject("listpo", listPo);
			mv.addObject("FileDownloadURL", fileURL);
		} catch (Exception e) {
			//System.out.println(e);
		}
		mv.setViewName("viewpo");
		return mv;
	}

}
