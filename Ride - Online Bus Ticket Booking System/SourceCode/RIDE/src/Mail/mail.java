package Mail;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import javax.swing.JOptionPane;

public class mail {

    public  static boolean mailsend(String msg, String email ,String frm,String pwd ) throws MessagingException {
    
boolean sts=false;
	try{
	//System.out.println(key+"...."+email);
    String host = "smtp.gmail.com";
	String s[]=frm.split("@");
     String from =s[0];
    String pass =pwd;
    Properties props = System.getProperties();
    props.put("mail.smtp.starttls.enable", "true"); // added this line
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.user", from);
    props.put("mail.smtp.password", pass);
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.auth", "true");

    String[] to = {email}; // added this line
for( int i=0; i < to.length; i++ ) { //   changed from a while loop
       System.out.println("i="+to[i]);
    }
    Session session = Session.getDefaultInstance(props, null);
    MimeMessage message = new MimeMessage(session);
    message.setFrom(new InternetAddress(from));

    InternetAddress[] toAddress = new InternetAddress[to.length];

    // To get the array of addresses
    for( int i=0; i < to.length; i++ ) { // changed from a while loop
        toAddress[i] = new InternetAddress(to[i]);
    }
    System.out.println(Message.RecipientType.TO);

    for( int i=0; i < toAddress.length; i++) { // changed from a while loop
        message.addRecipient(Message.RecipientType.TO, toAddress[i]);
    }
    message.setSubject("Confirmation Bus Ticket Booking");
    message.setText(msg);
    Transport transport = session.getTransport("smtp");
    transport.connect(host, from, pass);
    transport.sendMessage(message, message.getAllRecipients());
    transport.close();
	}
	catch(Exception e)
	{
e.printStackTrace();
return false;
	}
	   return true; 
}

 public  static boolean mailsend1(String msg, String email ,String frm,String pwd ) throws MessagingException {
    
boolean sts=false;
	try{
	//System.out.println(key+"...."+email);
    String host = "smtp.gmail.com";
	String s[]=frm.split("@");
     String from =s[0];
    String pass =pwd;
    Properties props = System.getProperties();
    props.put("mail.smtp.starttls.enable", "true"); // added this line
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.user", from);
    props.put("mail.smtp.password", pass);
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.auth", "true");

    String[] to = {email}; // added this line
for( int i=0; i < to.length; i++ ) { //   changed from a while loop
       System.out.println("i="+to[i]);
    }
    Session session = Session.getDefaultInstance(props, null);
    MimeMessage message = new MimeMessage(session);
    message.setFrom(new InternetAddress(from));

    InternetAddress[] toAddress = new InternetAddress[to.length];

    // To get the array of addresses
    for( int i=0; i < to.length; i++ ) { // changed from a while loop
        toAddress[i] = new InternetAddress(to[i]);
    }
    System.out.println(Message.RecipientType.TO);

    for( int i=0; i < toAddress.length; i++) { // changed from a while loop
        message.addRecipient(Message.RecipientType.TO, toAddress[i]);
    }
    message.setSubject("Confirmation Bus Ticket Cancelling");
    message.setText(msg);
    Transport transport = session.getTransport("smtp");
    transport.connect(host, from, pass);
    transport.sendMessage(message, message.getAllRecipients());
    transport.close();
	}
	catch(Exception e)
	{
e.printStackTrace();
return false;
	}
	   return true; 
}




    
}
 