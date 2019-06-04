package dao;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;

public class GeradorDeRelatorios {

    private final Connection con;

    public GeradorDeRelatorios(Connection con) {
        this.con = con;
    }

    public void geraPdf(String jrxml, Map<String, Object> parametros, HttpServletResponse response) throws IOException {
        try {

            JasperReport jasper = JasperCompileManager.compileReport(jrxml);

            JasperPrint print = JasperFillManager.fillReport(jasper, parametros, this.con);

            byte[] file = JasperRunManager.runReportToPdf(jasper, parametros, this.con);
            response.setContentType("application/pdf");
            response.setContentLength(file.length);
            OutputStream output = response.getOutputStream();
            output.write(file, 0, file.length);
            output.flush();
            //ConnectionFactory.close(this.con);
        } catch (JRException ex) {
            Logger.getLogger(GeradorDeRelatorios.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException("Erro ao gerar relatório", ex);
        }
    }
}
