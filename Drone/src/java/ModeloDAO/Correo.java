/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.CorreoVO;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author SEVEN
 */
public class Correo {

    public boolean enviarCorreo(CorreoVO cor) {

        try {
            System.out.println(cor.getUsuario());
            Properties p = new Properties();
            p.put("mail.smtp.host", "smtp.gmail.com");
            p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
            p.setProperty("mail.smtp.starttls.enable", "true");
            p.setProperty("mail.smtp.port", "587");
            p.setProperty("mail.smtp.user", cor.getUsuario());
            p.setProperty("mail.smtp.auth", "true");

            Session s = Session.getDefaultInstance(p, null);
            BodyPart text = new MimeBodyPart();
            text.setText(cor.getMensaje());
            BodyPart adjunto = new MimeBodyPart();
            MimeMultipart m = new MimeMultipart();
            m.addBodyPart(text);
            MimeMessage mensaje = new MimeMessage(s);
            mensaje.setFrom(new InternetAddress(cor.getUsuario()));
            mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(cor.getDestino()));
            mensaje.setSubject(cor.getAsunto());
            mensaje.setContent(m);
            Transport t = s.getTransport("smtp");
            t.connect(cor.getUsuario(), cor.getClave());
            t.sendMessage(mensaje, mensaje.getAllRecipients());
            t.close();
            return true;
        } catch (Exception e) {
            System.out.println("Error" + e.getMessage());
            return false;
        }
    }
}
