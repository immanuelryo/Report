package com.itdel.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.thymeleaf.expression.Arrays;

import com.itdel.model.Laporan;
import com.itdel.model.User;
import com.itdel.repository.LaporanRepository;
import com.itdel.service.LaporanService;
import com.itdel.service.UserService;

@Controller
public class LaporanController {
	
	@Autowired
	UserService userService;
	@Autowired
	LaporanService laporanService;
	
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
	
	private String UPLOADED_FOLDER =  "C://Users//Immanuel Sitanggang//Documents//GitHub//SpringBootSecurity-master//src//main//resources//static//";
	
	@PreAuthorize("hasRole('ROLE_DEVELOPER')")
	@RequestMapping("/developer/index")
	public ModelAndView developerHome()
	{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String singleFileUpload(HttpServletRequest request, @RequestParam("fileImage")MultipartFile[] filesImage,@RequestParam("fileLaporan")MultipartFile fileLaporan, RedirectAttributes redirectAttributes,Principal principal)
	{
		LocalDate localDate = LocalDate.now();
		String currentPrincipalName = principal.getName();
		User user = userService.findUserByEmail(currentPrincipalName);
		Path path;
		Laporan laporan = new Laporan();
		laporanService.saveLaporan(laporan);
		List<String> listNameFile =  new ArrayList<>();
		List<String> split =  new ArrayList<>();
		
		if (fileLaporan.isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "Please select a file Laporan to upload");
			return "redirect:/upload";
		}
		try {
			byte[] bytes = fileLaporan.getBytes();
			path = Paths.get(UPLOADED_FOLDER + "/file" +"/");
			Files.createDirectories(path);
			path = Paths.get(UPLOADED_FOLDER + "/file" +"/" +fileLaporan.getOriginalFilename());
			laporan.setFileLaporan(fileLaporan.getOriginalFilename());
			Files.write(path, bytes);
		}
		catch(IOException ioe) {
			ioe.printStackTrace();
		}
		try {
			
			for(MultipartFile file : filesImage)
			{
				byte[] bytes = file.getBytes();
				path = Paths.get(UPLOADED_FOLDER + "/images" +"/");
				Files.createDirectories(path);
				path = Paths.get(UPLOADED_FOLDER + "/images" +"/" +file.getOriginalFilename());
				Files.write(path, bytes);
				listNameFile.add(file.getOriginalFilename().toString());
				Collections.replaceAll(listNameFile, "i", "a");
				laporan.setImageList(listNameFile.toString().substring(1, listNameFile.toString().length()-1));
//				split = listNameFile.replaceAll("\\s","");  
//				System.out.println(listNameFile.replace(' ', 'a'));	
				System.out.println("bisa???"+listNameFile.toString());	
			}
			
			redirectAttributes.addFlashAttribute("message", "You succesfully uploaded "+ listNameFile.toString());
		}
		catch (IOException ioe) {
			ioe.printStackTrace();//
		}
		laporan.setNama(request.getParameter("nama").toString());
		laporan.setRoles(user.getRoleAsString());
		laporan.setUser(user);
		laporan.setTanggalLaporan(new Date());
		laporanService.saveLaporan(laporan);
		System.out.println(laporan);
		return "redirect:/upload";
	}
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public ModelAndView uploadPage(Principal principal)
	{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("upload");
		return modelAndView;
	}
	
	@RequestMapping (value="laporan/{id_Laporan}", method = RequestMethod.GET)
	public String lihatLaporan(@PathVariable Integer id_Laporan, Model model)
	{
		model.addAttribute("laporan", laporanService.getLaporan(id_Laporan));
		return "laporan";
	}	
	
//	@RequestMapping(value = "laporan/delete/{id_Laporan}", method = RequestMethod.GET)
//	public String deleteLaporan(Laporan laporan)
//	{
//		laporanService.deletelaporan(laporan);
//		return "laporan";
//	}
//	
	
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
		public String SearchByKeyword(Model model, HttpServletRequest request)
		{
			String nama = request.getParameter("nama");
			model.addAttribute("search", nama);
			model.addAttribute("listLaporan", laporanService.findJudul(nama));
			return "index";
		}
	
}