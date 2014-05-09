package de.fuberlin.wiwiss.d2rq.server;

import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;
import java.util.Date;
import java.io.BufferedReader;
import java.io.FileReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.velocity.context.Context;

import de.fuberlin.wiwiss.d2rq.ClassMapLister;

public class StatsServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
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

		// Loading stats
		try {
    			BufferedReader br = new BufferedReader(new FileReader("stats.txt"));
    		
        		String line = br.readLine();

			context.put("artists", line);
        		line = br.readLine();
	
			context.put("tracks", line);
			line = br.readLine();

			context.put("users", line);
			line = br.readLine();

			context.put("listening_events", line);
			line = br.readLine();

			context.put("updated_at", line);

			br.close();
    		} catch(Exception e) {
			context.put("artists", new Integer(0));
			context.put("tracks", new Integer(0));
			context.put("users", new Integer(0));
			context.put("listening_events", new Integer(0));
			context.put("updated_at", "...");
		}	

		velocity.mergeTemplateXHTML("stats_page.vm");
	}

	private static final long serialVersionUID = 8398903758486421941L;
}
