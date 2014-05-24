package de.fuberlin.wiwiss.d2rq.server;

import java.io.IOException;
import java.io.File;
import java.io.OutputStream;
import java.io.FileInputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.velocity.context.Context;

import de.fuberlin.wiwiss.d2rq.ClassMapLister;

public class DownloadServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		String format = request.getParameter("format");

         	String fileName = "nowplaying-dump.nt.gz";
         	String fileType = "application/rdf+xml";
         	
		if(format != null) {

			if(format.toLowerCase().equals("turtle")) {
				fileName = "nowplaying-dump.nt.gz";
				fileType = "text/turtle";
			}

		}

         	// Header
         	response.setContentType(fileType);
         	response.setHeader("Content-disposition","attachment; filename=" + fileName);

		// File
         	File my_file = new File(fileName);

         	// Send the file to the browser
         	OutputStream out = response.getOutputStream();
         	FileInputStream in = new FileInputStream(my_file);
         	byte[] buffer = new byte[4096];
         	int length;
         	while ((length = in.read(buffer)) > 0){
         		out.write(buffer, 0, length);
         	}
         	in.close();
         	out.flush();

	}

	private static final long serialVersionUID = 8390983758486421941L;
}
