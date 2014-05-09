package de.fuberlin.wiwiss.d2rq.server;

import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.velocity.context.Context;

import de.fuberlin.wiwiss.d2rq.ClassMapLister;

public class SnorqlServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		
		if(!request.getRequestURL().toString().contains("/snorql/")) {
			response.sendRedirect("/snorql/");
			return;
		}
				

		D2RServer server = D2RServer.fromServletContext(getServletContext());
		server.checkMappingFileChanged();
		Map<String,String> classMapLinks = new TreeMap<String,String>();
		ClassMapLister lister = D2RServer.retrieveSystemLoader(getServletContext()).getClassMapLister();
		for (String name: lister.classMapNames()) {
			classMapLinks.put(name, server.baseURI() + "directory/" + name);
		}
		VelocityWrapper velocity = new VelocityWrapper(this, request, response);
		Context context = velocity.getContext();
		context.put("classmap_links", classMapLinks);
		velocity.mergeTemplateXHTML("snorql_page.vm");
	}

	private static final long serialVersionUID = 8893903758486491241L;
}
