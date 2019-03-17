package de.lostuxos.examples.java11.ping;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

@Path("/hello")
public class Ping {

    @GET
    @Produces("text/plain")
    public Response ping() {
        return Response.ok("Hello from Thorntail!").build();
    }
}
