package Email;

import java.util.Properties;
import javax.mail.Message;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.net.ssl.*;

public class JavaEmail {

    Session mailSession;

    public static void main(String args[]) throws AddressException, MessagingException {
        JavaEmail javaEmail = new JavaEmail();
        javaEmail.setMailServerProperties();
        javaEmail.draftEmailMessage();
        javaEmail.sendEmail();
    }

    private void setMailServerProperties() {
        Properties emailProperties = System.getProperties();
//        587
        emailProperties.put("mail.smtp.port", "587");
        emailProperties.put("mail.smtp.auth", "true");
        emailProperties.put("mail.smtp.starttls.enable", "true");
        mailSession = Session.getDefaultInstance(emailProperties, null);
    }

    private MimeMessage draftEmailMessage() throws AddressException, MessagingException {
        String[] toEmails = {"CharithaRat@masholdings.com"};
        String emailSubject = "Mas Holdings";
        String emailBody = "<b>http://www.pcnw.lk</b>.";
        MimeMessage emailMessage = new MimeMessage(mailSession);
        for (int i = 0; i < toEmails.length; i++) {
            emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails[i]));
        }
        emailMessage.setSubject(emailSubject);
        emailMessage.setContent(emailBody, "text/html");
        return emailMessage;
    }

    private void sendEmail() throws AddressException, MessagingException {
        String fromUser = "charitharathnayaka@gmail.com";
        String fromUserEmailPassword = "46368931";

        String emailHost = "smtp.gmail.com";
        Transport transport = mailSession.getTransport("smtp");
        transport.connect(emailHost, fromUser, fromUserEmailPassword);

        MimeMessage emailMessage = draftEmailMessage();
        transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
        transport.close();
        System.out.println("Email sent successfully.");
    }
}
