/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.util.Date;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author Bhavesh Singh
 */
public class SendMail {
    
    
    public int send( String emailAddress , String firstName , String City){
        
        
        
                 
		String host = "smtp.gmail.com";
        String port = "587";
        String mailFrom = "diakadam07@gmail.com";
        String password1 = "dishadeepakdivya";
        String mailTo = emailAddress;
        String subject = "Greeting";
        String message = "Thank you "+firstName+" for Donating your valuable Food in "+City+", Hope We see you again ";
		 try {
		
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.user", mailFrom);
        properties.put("mail.password", password1);
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(mailFrom, password1);
            }
        };
        Session session1 = Session.getInstance(properties, auth);
         Message msg = new MimeMessage(session1);
        msg.setFrom(new InternetAddress(mailFrom));
        InternetAddress[] toAddresses = { new InternetAddress(mailTo) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
  
        msg.setSentDate(new Date());
        MimeBodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setContent(message, "text/html");
         Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
	 msg.setContent(multipart);
	Transport.send(msg);
        
                  
        
        
        }
                 
                 catch (Exception ex) {
           ex.printStackTrace();
           
           
         return  1 ;
        }
                 
                 
            return 0;     
                 
    }
    
    
    
    
}
