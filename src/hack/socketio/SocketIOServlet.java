package hack.socketio;

import javax.servlet.http.HttpServlet;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.Configuration;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.listener.DataListener;

import hack.socketio.ChatObject;
/*
public class SocketIOServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SocketIOServlet() {
        super();
        
        Configuration config = new Configuration();
        config.setHostname("0.0.0.0");
        config.setPort(9092);
        
        // TODO Auto-generated constructor stub
        final SocketIOServer server = new SocketIOServer(config);
        server.addEventListener("connection", ChatObject.class, new DataListener<ChatObject>() {
            @Override
            public void onData(SocketIOClient client, ChatObject data, AckRequest ackRequest) {
                // broadcast messages to all clients
            	System.out.println("Client Connected");
                server.getBroadcastOperations().sendEvent("chatevent", data);
            }
        });
        server.addEventListener("disconnect", ChatObject.class, new DataListener<ChatObject>(){

        	@Override
        	public void onData(SocketIOClient client, ChatObject obj, AckRequest arg2) throws Exception {
        		// TODO Auto-generated method stub
        		System.out.println("Client Disconnected");
        	}

        });
        server.start();
        System.out.println("Servlet Initialised");
    }
}
*/