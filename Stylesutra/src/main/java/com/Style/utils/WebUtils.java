package com.Style.utils;

import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.ui.Model;

import com.Style.model.User;

public class WebUtils {
	
	public static void sendUserVerificationLink(String user_firstname,String user_email,String accessToken) throws MessagingException
	{		
		
			
			  
			String from="onks8686192001@gmail.com";
			String subject="Email Verification";
			String to=user_email;
			String text="<html><body><h1>Dear,"+user_firstname+"</h1>"
					+ "<h4>Thank you for registering with <strong>Stylesutraa</strong></h4><h4> To complete your registration and activate your account, please click on the following verification link:<h4>"
					+ "http://192.168.0.218:8080/verify?token=" + accessToken	  
					+ "<h5>Please note that this link is valid for a limited time After login this link Will be get Expire.</h5>"
					+ "<h5>If you didn't request this registration, please disregard this email. Your account will not be activated until you click the verification link above.</h5>"
					+ "<h3>Thank you for choosing Stylesutraa!</h3>"
					+ "<h2>Best regards,</h2>"
					+ "<h3>Stylesutraa</h3>"  
	                +"</body></html>"; 
					
	
			// Variable for host
					String  host="smtp.gmail.com";
					
					Properties properties=System.getProperties();
					properties.put("mail.smtp.host", host);
					properties.put("mail.smtp.port", "465");
					properties.put("mail.smtp.ssl.enable", "true");
					properties.put("mail.smtp.auth", "true");
					
					
					
					//step1: Get Sessin object
				Session session=Session.getInstance(properties, new Authenticator() {

						@Override
						protected PasswordAuthentication getPasswordAuthentication() {
							
								return new PasswordAuthentication("onks8686192001@gmail.com", "novnabvdrglqndil");
							
						}
					
					});
					 // for debugging 
				session.setDebug(true);
					
					//Step 2:Compose Message[text / multimedia]
					MimeMessage m = new MimeMessage(session);
					
					//set from gmail address
					m.setFrom(from);
					
					// Recipient Addresss
					m.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
					
					//Subject
					m.setSubject(subject);
					
					//Adding content
					m.setContent(text,"text/html; charset=utf-8");
					
					//Adding TExt
//					m.setText(text);
					
					//Step 3: Send mail Usaing Transport Class
					Transport.send(m);
					
					System.out.println("Mail Send Success..");
				
		
	}

}
