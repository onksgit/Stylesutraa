package com.Style.controller;

import java.io.PrintWriter;
import java.util.UUID;

import javax.mail.MessagingException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Style.model.User;
import com.Style.service.Adminservice;
import com.Style.service.Userservice;
import com.Style.utils.Message;
import com.Style.utils.WebUtils;
import com.oracle.wls.shaded.org.apache.xalan.lib.Redirect;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Usercontroller {

	@Autowired
	private Userservice Userservice;

	public void setUserservice(Userservice userservice) {
		Userservice = userservice;
	}

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@RequestMapping("/login")
	public String login(HttpSession httpSession, RedirectAttributes rd, Model model) {
		User user = (User) httpSession.getAttribute("userobj");
		if (user != null) {
			model.addAttribute("user", user);
			return "redirect:myprofile";
		} else
			return "user/login";

	}
	@RequestMapping("/userLogout")
	public String userLogout(HttpSession httpsession,RedirectAttributes rd) {
		User user= (User) httpsession.getAttribute("userobj");
		System.out.println("UserLogout="+user);
		httpsession.removeAttribute("userobj");
		rd.addFlashAttribute("usermsg", Message.getMessage("user.logoutsuccess.msg"));
		return "redirect:login";
	}
	

	@RequestMapping("/register")
	public String register() {
		return "user/register";
	}

	@RequestMapping("/myprofile")
	public String myprofile(HttpSession httpSession, RedirectAttributes rd, Model model) {
		User user = (User) httpSession.getAttribute("userobj");
		if(user!=null) {
		model.addAttribute("user", user);
		return "user/myprofile";
		}
		else
			return "redirect:login";
	}

	@RequestMapping("/verifyuser")
	public String verifyuser(@RequestParam String user_firstname, @RequestParam String user_lastname,
			@RequestParam String user_email, @RequestParam String user_password, RedirectAttributes rd, Model model) {
		try {
			if (!user_email.trim().isEmpty() || !user_email.trim().equals("")) {
				User user = Userservice.getUserByEmail(user_email);
				if (user == null) {
					String accessToken = UUID.randomUUID().toString();
					int uid = Userservice.saveUser(user_firstname, user_lastname, user_email, user_password,
							accessToken);
					rd.addFlashAttribute("verificationsuccessmsg", "Success");
					WebUtils.sendUserVerificationLink(user_firstname, user_email, accessToken);
					return "redirect:/";

				} else {
					rd.addFlashAttribute("usermsg", Message.getMessage("user.alreadyexist.msg"));
					return "redirect:login";
				}
			} else {
				rd.addFlashAttribute("usermsg", Message.getMessage("user.invalidemail.msg"));
				return "redirect:register";
			}
		} catch (MessagingException e) {
			e.printStackTrace();
			rd.addFlashAttribute("usermsg", Message.getMessage("user.somethingwrong.msg"));
			return "redirect:register";
		}

	}

	@RequestMapping("/verify")
	public String verifyUserAccessToken(@RequestParam("token") String accessToken, RedirectAttributes rd, Model model) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			if (!accessToken.isEmpty() || accessToken != null) {
				User user = Userservice.getUserByAccessToken(accessToken);
				if (user != null || !user.equals(null)) {
					user.setIs_varified(true);
					session.update(user);
					transaction.commit();
					rd.addFlashAttribute("usermsg", Message.getMessage("user.verifysuccess.msg"));
					return "redirect:login";

				} else {
					rd.addFlashAttribute("usermsg", Message.getMessage("user.invaliduser.msg"));
					return "redirect:register";
				}

			} else {
				rd.addFlashAttribute("usermsg", Message.getMessage("user.invalidtoken.msg"));
				return "redirect:login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			rd.addFlashAttribute("usermsg", Message.getMessage("user.invalidtoken.msg"));
			return "redirect:login";
		}

	}

	@RequestMapping("/validateuser")
	public String validateuser(@RequestParam String user_email, @RequestParam String user_password,
			RedirectAttributes rd, HttpSession httpsession) {
		User user = null;
		try {
			if (!user_email.trim().isEmpty() || !user_email.trim().equalsIgnoreCase("") || user_email != null
					|| user_password != null || user_password.trim().equalsIgnoreCase("")) {
				user = Userservice.getUserByEmail(user_email);
				if (user != null || !user.equals(null)) {
					if (user.getUser_password().trim().equalsIgnoreCase(user_password)) {
						if (Userservice.validateUser(user, user_password)) {
							if (user.getUser_type().trim().equals("customer")) {
								httpsession.setAttribute("userobj", user);
								rd.addFlashAttribute("loginsuccessmsg", Message.getMessage("user.loginsuccess.msg"));
								return "redirect:/";
							} else if (user.getUser_type().trim().equals("admin")) {
								httpsession.setAttribute("userobj", user);
								rd.addFlashAttribute("loginsuccessmsg", Message.getMessage("user.loginsuccess.msg"));
								return "redirect:dashbord";
							}
						} else {
							rd.addFlashAttribute("usermsg", Message.getMessage("user.verifyincomplete.msg"));
							return "redirect:login";
						}
					} else {
						rd.addFlashAttribute("usermsg", Message.getMessage("user.password.msg"));
						return "redirect:login";
					}
				} else {
					rd.addFlashAttribute("usermsg", Message.getMessage("user.username.msg"));
					return "redirect:login";
				}

			} else {
				rd.addFlashAttribute("usermsg", Message.getMessage("user.invalidcredencial.msg"));
				return "redirect:login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			rd.addFlashAttribute("usermsg", Message.getMessage("user.invalidcredencial.msg"));
			return "redirect:login";
		}
		return "";

	}

//	@RequestMapping("/sendotp")
//	public String sendotp(@RequestParam("user_email") String email, RedirectAttributes rd) {
//		if (!email.isEmpty() || email != null || !email.trim().equalsIgnoreCase("")) {
//			try {
//				WebUtils.sendOtp(email);
//				rd.addFlashAttribute("otpmsg", "Mail Sent Successfully");
//				rd.addFlashAttribute("email", email);
//				return "redirect:register";
//			} catch (MessagingException e) {
//				rd.addFlashAttribute("otpmsg", "Please Enter Valid mail");
//				rd.addFlashAttribute("email", email);
//				e.printStackTrace();
//				return "redirect:register";
//			}
//		} else
//			rd.addFlashAttribute("otpmsg", "Please Enter Vaid mail");
//		rd.addFlashAttribute("email", email);
//
//		return "redirect:register";
//
//	}

}
